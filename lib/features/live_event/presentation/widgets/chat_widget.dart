import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:test_flutter_bnj/features/auth/domain/repositories/user_repository.dart';
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/chat_message.dart'
    as domain;
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/presentation/bloc/live_event_bloc.dart';
import 'package:test_flutter_bnj/injection.dart';

class ChatWidget extends StatefulWidget {
  final String eventId;

  const ChatWidget({required this.eventId, super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with AutomaticKeepAliveClientMixin {
  late final ChatController _chatController;
  final List<TextMessage> _uiMessages = [];
  StreamSubscription<domain.ChatMessage>? _chatSubscription;
  late StreamSubscription<LiveEventState>? _liveStateSub;
  final MockSocketService _socketService = getIt<MockSocketService>();
  bool _isLive = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _chatController = InMemoryChatController();

    // Charger l'historique des messages pour cet event
    for (final domainMsg in _socketService.getMessagesForEvent(widget.eventId)) {
      final ui = _mapDomainToUi(domainMsg);
      _chatController.insertMessage(ui);
      _uiMessages.add(ui);
    }

    // Écouter les changements d'état du live pour démarrer/arrêter la simulation du chat
    final liveBloc = context.read<LiveEventBloc>();
    // Première évaluation de l'état courant
    final currentState = liveBloc.state;
    if (currentState is LiveEventDetailLoaded) {
      _isLive = currentState.event.status == LiveEventStatus.live;
    }
    _configureChatSimulation(_isLive);

    // Joindre l'event pour démarrer le viewerCount (même hors live)
    final currentUserId = context.read<AuthBloc>().state is Authenticated
        ? (context.read<AuthBloc>().state as Authenticated).user.id
        : null;
    liveBloc.add(JoinLiveEvent(widget.eventId, currentUserId: currentUserId));

    // Écoute continue pour basculer dynamiquement
    _liveStateSub = liveBloc.stream.listen((state) {
      if (state is LiveEventDetailLoaded) {
        final nowLive = state.event.status == LiveEventStatus.live;
        if (nowLive != _isLive) {
          _isLive = nowLive;
          _configureChatSimulation(_isLive);
        }
      }
    });
  }

  void _configureChatSimulation(bool enable) {
    // Arrêter l'abonnement existant d'abord
    _chatSubscription?.cancel();
    _chatSubscription = null;

    if (enable) {
      // Démarrer l'écoute des messages temps réel
      _chatSubscription = _socketService.chatMessages.listen(_onMessageReceived);
    }
  }

  void _onMessageReceived(domain.ChatMessage message) {
    if (mounted) {
      // Ne pas ajouter les messages d'autres events si l'info est disponible
      try {
        final eventIdField = (message as dynamic).eventId;
        if (eventIdField != null && eventIdField != widget.eventId) {
          return;
        }
      } catch (_) {}
      final uiMessage = _mapDomainToUi(message);
      _chatController.insertMessage(uiMessage);
      setState(() {
        _uiMessages.add(uiMessage);
      });
    }
  }

  TextMessage _mapDomainToUi(domain.ChatMessage message) {
    return TextMessage(
      id: message.id,
      text: message.message,
      createdAt: message.timestamp,
      authorId: message.senderId,
    );
  }

  @override
  void dispose() {
    _chatSubscription?.cancel();
    _liveStateSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) {
          return const Center(child: CircularProgressIndicator());
        }
        final currentUserId = authState.user.id;
        final liveState = context.watch<LiveEventBloc>().state;
        bool isLive = false;
        if (liveState is LiveEventDetailLoaded) {
          isLive = liveState.event.status == LiveEventStatus.live;
        }

        if (!isLive) {
          // Lecture seule avec ListView.builder et bulles custom
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.orange.withValues(alpha: 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: const [
                    Icon(LucideIcons.info, size: 16, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Live hors ligne: le chat est en lecture seule. Les nouveaux messages ne sont pas acceptés.',
                        style: TextStyle(fontSize: 12, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _uiMessages.isEmpty
                    ? const Center(child: Text('Aucun message'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _uiMessages.length,
                        itemBuilder: (context, index) {
                          final msg = _uiMessages[index];
                          final isMe = msg.authorId == currentUserId;
                          return _ChatBubble(
                            message: msg.text,
                            timestamp: msg.createdAt?.millisecondsSinceEpoch,
                            isMe: isMe,
                          );
                        },
                      ),
              ),
            ],
          );
        }

        // Mode live: utiliser flutter_chat_ui
        final chatWidget = Chat(
          currentUserId: currentUserId,
          resolveUser: (id) async {
            final user = await getIt<UserRepository>().getUserById(id);
            return User(
              id: id,
              name: user?.name,
              imageSource: user?.avatar,
              metadata: {'isVendor': user?.isVendor ?? false},
            );
          },
          builders: Builders(
            chatMessageBuilder: (
              ctx,
              message,
              index,
              animation,
              child, {
              bool? isRemoved,
              required bool isSentByMe,
              MessageGroupStatus? groupStatus,
            }) {
              return ChatMessage(
                message: message,
                index: index,
                animation: animation,
                groupStatus: groupStatus,
                topWidget: isSentByMe
                    ? null
                    : Row(
                        children: [
                          Avatar(userId: message.authorId, size: 16),
                          Gap(2),
                          Username(userId: message.authorId),
                        ],
                      ),
                child: child,
              );
            },
          ),
          chatController: _chatController,
          onMessageSend: (message) async {
            await _socketService.sendChatMessage(currentUserId, message);
          },
        );

        return chatWidget;
      },
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;
  final int? timestamp;
  final bool isMe;

  const _ChatBubble({
    required this.message,
    required this.timestamp,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = isMe ? theme.colorScheme.primary.withValues(alpha: 0.1) : theme.colorScheme.surfaceVariant;
    final textColor = isMe ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isMe ? 12 : 2),
            bottomRight: Radius.circular(isMe ? 2 : 12),
          ),
          border: Border.all(color: isMe ? theme.colorScheme.primary.withValues(alpha: 0.2) : theme.dividerColor.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: TextStyle(color: textColor)),
            if (timestamp != null) ...[
              const SizedBox(height: 4),
              Text(
                DateTime.fromMillisecondsSinceEpoch(timestamp!).toLocal().toString(),
                style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

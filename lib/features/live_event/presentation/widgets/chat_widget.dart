import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter_bnj/features/auth/domain/repositories/user_repository.dart';
import 'package:test_flutter_bnj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/chat_message.dart'
    as domain;
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
  late StreamSubscription<domain.ChatMessage> _chatSubscription;
  final MockSocketService _socketService = getIt<MockSocketService>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _chatController = InMemoryChatController();

    // 1. Charger les messages déjà existants dans la session du socket pour CET event
    for (final domainMsg in _socketService.getMessagesForEvent(widget.eventId)) {
      _chatController.insertMessage(_mapDomainToUi(domainMsg));
    }

    // 2. Écouter les futurs messages
    _chatSubscription = _socketService.chatMessages.listen(_onMessageReceived);

    final currentUserId = context.read<AuthBloc>().state is Authenticated
        ? (context.read<AuthBloc>().state as Authenticated).user.id
        : null;
    getIt<LiveEventBloc>()
      .add(JoinLiveEvent(widget.eventId, currentUserId: currentUserId));
  }

  void _onMessageReceived(domain.ChatMessage message) {
    if (mounted) {
      // On convertit le message du domaine vers le type attendu par l'UI
      final uiMessage = _mapDomainToUi(message);

      // On l'ajoute au contrôleur uniquement si le message appartient à ce live
      // Note: Dans un vrai système, le socket filtrerait par room (eventId)
      // Ici on simule ce filtrage côté client car MockSocketService diffuse tout.
      // On récupère l'eventId via le repo ou une logique de room inexistante ici,
      // mais on peut se baser sur l'historique ou simplement accepter que
      // MockSocketService ne simule qu'un live "actif" à la fois pour les messages en temps réel.
      _chatController.insertMessage(uiMessage);
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
    _chatSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Nécessaire pour AutomaticKeepAliveClientMixin
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Chat(
            currentUserId: state.user.id,
            resolveUser: (id) async {
              final user = await getIt<UserRepository>().getUserById(id);
              return User(id: id, name: user?.name, imageSource: user?.avatar, metadata: {'isVendor': user?.isVendor ?? false});
            },
            builders: Builders(
              chatMessageBuilder:
                  (
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
                                Username(userId: message.authorId,),
                              ],
                            ),
                      child: child,
                    );
                  },
            ),

            chatController: _chatController,
            onMessageSend: (message) async {
              // Envoyer le message via le socket
              await _socketService.sendChatMessage(state.user.id, message);
              // Le message sera ajouté à l'UI via le stream du socket
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

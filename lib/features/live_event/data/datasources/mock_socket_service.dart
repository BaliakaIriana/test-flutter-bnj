import 'dart:async';
import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/auth/domain/repositories/user_repository.dart';
import 'package:test_flutter_bnj/features/live_event/domain/repositories/live_event_repository.dart';
import 'package:test_flutter_bnj/features/live_event/domain/repositories/chat_repository.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class MockSocketService {
  final _chatController = StreamController<ChatMessage>.broadcast();
  final _viewerCountController = StreamController<int>.broadcast();
  final _featuredProductController = StreamController<Product?>.broadcast();
  final LiveEventRepository repository;
  final UserRepository userRepository;
  final ChatRepository chatRepository;

  Timer? _viewerCountTimer;
  Timer? _autoChatTimer;

  // Stockage des messages par événement pour ne pas les perdre en changeant de live
  final Map<String, List<ChatMessage>> _messagesByEvent = {};
  String? _currentEventId;

  MockSocketService(this.repository, this.userRepository, this.chatRepository);

  Stream<ChatMessage> get chatMessages => _chatController.stream;

  // Remplacé par une méthode prenant l'eventId
  List<ChatMessage> getMessagesForEvent(String eventId) =>
      List.unmodifiable(_messagesByEvent[eventId] ?? []);

  Stream<int> get viewerCount => _viewerCountController.stream;

  Stream<Product?> get featuredProduct => _featuredProductController.stream;

  Future<void> joinLiveEvent(String eventId, {String? currentUserId}) async {
    // On permet de "rejoindre" pour relancer les timers si on change d'écran,
    // mais on ne vide plus les messages.
    _currentEventId = eventId;

    // Initialiser la liste si c'est le premier passage
    _messagesByEvent.putIfAbsent(eventId, () => []);

    final eventEither = await repository.getLiveEventById(eventId);
    eventEither.fold((failure) {

    }, (event) {

      _viewerCountTimer = Timer.periodic(Duration(seconds: 3), (timer) {
        final baseViewers = event.viewerCount + 1;
        final fluctuation = Random().nextInt(50) - 25;
        _viewerCountController.add(baseViewers + fluctuation);
      });

      _startAutoChat(eventId, currentUserId: currentUserId, sellerId: event.seller.id);
      _viewerCountController.add(250);
    });
  }

  Future<void> _startAutoChat(String eventId, {
    String? currentUserId,
    String? sellerId,
  }) async {
    _autoChatTimer?.cancel();

    // 1. Charger l'historique initial uniquement si la liste est vide
    if (_messagesByEvent[eventId]!.isEmpty) {
      final chatResult = await chatRepository.getChatMessages(eventId);
      chatResult.fold(
        (failure) => null,
        (messages) {
          for (final msg in messages) {
            _messagesByEvent[eventId]!.add(msg);
            _chatController.add(msg);
          }
        },
      );
    }

    // 2. Récupérer les utilisateurs et filtrer : exclure moi-même et le vendeur du live
    final allUsers = await userRepository.getUsers();
    final validChatters = allUsers.where((u) {
      final isMe = currentUserId != null && u.id == currentUserId;
      final isSeller = sellerId != null && u.id == sellerId;
      return !isMe && !isSeller;
    }).toList();

    final List<String> fakeMsgs = [
      'Super produit ! 🔥',
      'Quel est le prix ?',
      'J\'adore cette couleur !',
      'Disponible en taille M ?',
      'Livraison gratuite ?',
      'C\'est magnifique 😍',
      'Je viens d\'en commander un !',
    ];

    if (validChatters.isEmpty) return;

    _autoChatTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentEventId != eventId) return; // Sécurité si on a changé d'event entre temps

      final randomUser = validChatters[Random().nextInt(validChatters.length)];

      final msg = ChatMessage(
        id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
        senderId: randomUser.id,
        senderName: randomUser.name,
        message: fakeMsgs[Random().nextInt(fakeMsgs.length)],
        timestamp: DateTime.now(),
        isVendor: false,
        reactions: [],
      );

      _messagesByEvent[eventId]!.add(msg);
      _chatController.add(msg);
    });
  }

  Future<void> sendChatMessage(String senderId, String message) async {
    if (_currentEventId == null) return;
    final eventId = _currentEventId!;

    await Future.delayed(Duration(milliseconds: 200));

    final msg = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      senderId: senderId,
      senderName: 'Vous',
      message: message,
      timestamp: DateTime.now(),
      isVendor: false,
      reactions: [],
    );

    _messagesByEvent[eventId]?.add(msg);
    _chatController.add(msg);
  }

  void leaveLiveEvent(String eventId) {
    _viewerCountTimer?.cancel();
    _autoChatTimer?.cancel();
  }

  void dispose() {
    _chatController.close();
    _viewerCountController.close();
    _featuredProductController.close();
    _viewerCountTimer?.cancel();
    _autoChatTimer?.cancel();
    _messagesByEvent.clear();
  }
}

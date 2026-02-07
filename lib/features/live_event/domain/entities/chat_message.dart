import 'package:equatable/equatable.dart';

class ChatReply extends Equatable {
  final String id;
  final String sender;
  final String message;

  const ChatReply({
    required this.id,
    required this.sender,
    required this.message,
  });

  @override
  List<Object?> get props => [id, sender, message];
}

class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;
  final bool isVendor;
  final ChatReply? replyTo;
  final List<String> reactions;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
    required this.isVendor,
    this.replyTo,
    required this.reactions,
  });

  @override
  List<Object?> get props => [
        id,
        senderId,
        senderName,
        message,
        timestamp,
        isVendor,
        replyTo,
        reactions,
      ];
}

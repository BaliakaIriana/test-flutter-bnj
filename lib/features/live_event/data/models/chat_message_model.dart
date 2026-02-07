import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/chat_message.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
abstract class ChatReplyModel with _$ChatReplyModel {
  const factory ChatReplyModel({
    required String id,
    required String sender,
    required String message,
  }) = _ChatReplyModel;

  factory ChatReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ChatReplyModelFromJson(json);
}

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String id,
    required String senderId,
    required String senderName,
    required String message,
    required DateTime timestamp,
    required bool isVendor,
    ChatReplyModel? replyTo,
    required List<String> reactions,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}

extension ChatReplyModelX on ChatReplyModel {
  ChatReply toEntity() {
    return ChatReply(
      id: id,
      sender: sender,
      message: message,
    );
  }
}

extension ChatMessageModelX on ChatMessageModel {
  ChatMessage toEntity() {
    return ChatMessage(
      id: id,
      senderId: senderId,
      senderName: senderName,
      message: message,
      timestamp: timestamp,
      isVendor: isVendor,
      replyTo: replyTo?.toEntity(),
      reactions: reactions,
    );
  }
}

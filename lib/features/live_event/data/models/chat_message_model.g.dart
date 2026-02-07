// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatReplyModel _$ChatReplyModelFromJson(Map<String, dynamic> json) =>
    _ChatReplyModel(
      id: json['id'] as String,
      sender: json['sender'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChatReplyModelToJson(_ChatReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'message': instance.message,
    };

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isVendor: json['isVendor'] as bool,
      replyTo: json['replyTo'] == null
          ? null
          : ChatReplyModel.fromJson(json['replyTo'] as Map<String, dynamic>),
      reactions: (json['reactions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'isVendor': instance.isVendor,
      'replyTo': instance.replyTo,
      'reactions': instance.reactions,
    };

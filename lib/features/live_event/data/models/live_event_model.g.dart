// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveEventModel _$LiveEventModelFromJson(Map<String, dynamic> json) =>
    _LiveEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
      seller: SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      featuredProduct: json['featuredProduct'] as String?,
      viewerCount: (json['viewerCount'] as num).toInt(),
      streamUrl: json['streamUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      replayUrl: json['replayUrl'] as String?,
    );

Map<String, dynamic> _$LiveEventModelToJson(_LiveEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'seller': instance.seller,
      'products': instance.products,
      'featuredProduct': instance.featuredProduct,
      'viewerCount': instance.viewerCount,
      'streamUrl': instance.streamUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'replayUrl': instance.replayUrl,
    };

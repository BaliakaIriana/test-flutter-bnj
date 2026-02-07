// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerModel _$SellerModelFromJson(Map<String, dynamic> json) => _SellerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  storeName: json['storeName'] as String,
  avatar: json['avatar'] as String,
);

Map<String, dynamic> _$SellerModelToJson(_SellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'storeName': instance.storeName,
      'avatar': instance.avatar,
    };

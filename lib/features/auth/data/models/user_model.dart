import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String avatar,
    required DateTime createdAt,
    String? storeName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      avatar: avatar,
      createdAt: createdAt,
      storeName: storeName,
    );
  }
}

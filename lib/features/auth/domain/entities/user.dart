import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String? storeName;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.createdAt,
      this.storeName,
  });

  @override
  List<Object?> get props => [id, email, name, avatar, storeName, createdAt];

  bool get isVendor => storeName != null && storeName!.isNotEmpty;
}

import 'package:equatable/equatable.dart';

class Seller extends Equatable {
  final String id;
  final String name;
  final String storeName;
  final String avatar;

  const Seller({
    required this.id,
    required this.name,
    required this.storeName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, storeName, avatar];
}

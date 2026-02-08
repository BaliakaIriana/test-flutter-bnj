import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String productId;
  final String name;
  final double price;
  final String? thumbnail;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    this.thumbnail,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) => CartItem(
        productId: productId,
        name: name,
        price: price,
        thumbnail: thumbnail,
        quantity: quantity ?? this.quantity,
      );

  @override
  List<Object?> get props => [productId, name, price, thumbnail, quantity];
}

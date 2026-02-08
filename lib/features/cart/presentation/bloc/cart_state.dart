part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  const CartState({required this.items});
  int get totalQuantity => items.fold(0, (sum, e) => sum + e.quantity);
  double get totalPrice => items.fold(0.0, (sum, e) => sum + e.price * e.quantity);
  @override
  List<Object?> get props => [items];
}

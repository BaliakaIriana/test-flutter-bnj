part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class CartLoad extends CartEvent {}

class CartAdd extends CartEvent {
  final CartItem item;
  const CartAdd(this.item);
  @override
  List<Object?> get props => [item];
}

class CartRemove extends CartEvent {
  final String productId;
  const CartRemove(this.productId);
  @override
  List<Object?> get props => [productId];
}

class CartClear extends CartEvent {}

class CartIncrement extends CartEvent {
  final String productId;
  const CartIncrement(this.productId);
  @override
  List<Object?> get props => [productId];
}

class CartDecrement extends CartEvent {
  final String productId;
  const CartDecrement(this.productId);
  @override
  List<Object?> get props => [productId];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/cart/domain/entities/cart_item.dart';
import 'package:test_flutter_bnj/features/cart/domain/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  CartBloc(this.repository) : super(const CartState(items: const [])) {
    on<CartLoad>((event, emit) async {
      final items = await repository.getItems();
      emit(CartState(items: items));
    });
    on<CartAdd>((event, emit) async {
      await repository.addItem(event.item);
      final items = await repository.getItems();
      emit(CartState(items: items));
    });
    on<CartRemove>((event, emit) async {
      await repository.removeItem(event.productId);
      final items = await repository.getItems();
      emit(CartState(items: items));
    });
    on<CartClear>((event, emit) async {
      await repository.clear();
      emit(const CartState(items: const []));
    });
    on<CartIncrement>((event, emit) async {
      await repository.incrementItem(event.productId);
      final items = await repository.getItems();
      emit(CartState(items: items));
    });
    on<CartDecrement>((event, emit) async {
      await repository.decrementItem(event.productId);
      final items = await repository.getItems();
      emit(CartState(items: items));
    });
  }
}

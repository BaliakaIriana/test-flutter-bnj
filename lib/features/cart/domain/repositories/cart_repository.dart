import 'package:test_flutter_bnj/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<void> addItem(CartItem item);
  Future<void> removeItem(String productId);
  Future<void> clear();
  Future<List<CartItem>> getItems();
  Future<void> incrementItem(String productId);
  Future<void> decrementItem(String productId);
}

import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_bnj/features/cart/domain/entities/cart_item.dart';
import 'package:test_flutter_bnj/features/cart/domain/repositories/cart_repository.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final Map<String, CartItem> _items = {};
  static const _prefsKey = 'cart_items';

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final list = _items.values
        .map(
          (e) => {
            'productId': e.productId,
            'name': e.name,
            'price': e.price,
            'thumbnail': e.thumbnail,
            'quantity': e.quantity,
          },
        )
        .toList();
    await prefs.setString(_prefsKey, jsonEncode(list));
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_prefsKey);
    if (jsonStr == null) return;
    final List<dynamic> list = jsonDecode(jsonStr);
    _items
      ..clear()
      ..addAll(
        {
          for (final m in list)
            (m['productId'] as String): CartItem(
                productId: m['productId'] as String,
                name: m['name'] as String,
                price: (m['price'] as num).toDouble(),
                thumbnail: m['thumbnail'] as String?,
                quantity: (m['quantity'] as num).toInt(),
                )
        },
      );
  }

  @override
  Future<void> addItem(CartItem item) async {
    if (_items.containsKey(item.productId)) {
      final existing = _items[item.productId]!;
      _items[item.productId] =
          existing.copyWith(quantity: existing.quantity + 1);
    } else {
      _items[item.productId] = item;
    }
    await _save();
  }

  @override
  Future<void> removeItem(String productId) async {
    _items.remove(productId);
    await _save();
  }

  @override
  Future<void> clear() async {
    _items.clear();
    await _save();
  }

  @override
  Future<List<CartItem>> getItems() async {
    await _load();
    return _items.values.toList(growable: false);
  }

  @override
  Future<void> incrementItem(String productId) async {
    await _load();
    final existing = _items[productId];
    if (existing != null) {
      _items[productId] = existing.copyWith(quantity: existing.quantity + 1);
      await _save();
    }
  }

  @override
  Future<void> decrementItem(String productId) async {
    await _load();
    final existing = _items[productId];
    if (existing != null) {
      final newQty = existing.quantity - 1;
      if (newQty <= 0) {
        _items.remove(productId);
      } else {
        _items[productId] = existing.copyWith(quantity: newQty);
      }
      await _save();
    }
  }
}

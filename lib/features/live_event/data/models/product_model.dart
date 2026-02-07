import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    double? salePrice,
    required List<String> images,
    required String thumbnail,
    required int stock,
    Map<String, List<String>>? variations,
    required bool isFeatured,
    DateTime? featuredAt,
    required String category,
    required double rating,
    required int reviewsCount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      salePrice: salePrice,
      images: images,
      thumbnail: thumbnail,
      stock: stock,
      variations: variations,
      isFeatured: isFeatured,
      featuredAt: featuredAt,
      category: category,
      rating: rating,
      reviewsCount: reviewsCount,
    );
  }
}

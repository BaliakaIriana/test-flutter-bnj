import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? salePrice;
  final List<String> images;
  final String thumbnail;
  final int stock;
  final Map<String, List<String>>? variations;
  final bool isFeatured;
  final DateTime? featuredAt;
  final String category;
  final double rating;
  final int reviewsCount;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.salePrice,
    required this.images,
    required this.thumbnail,
    required this.stock,
    this.variations,
    required this.isFeatured,
    this.featuredAt,
    required this.category,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        salePrice,
        stock,
        isFeatured,
        category,
        rating,
        reviewsCount,
      ];
}
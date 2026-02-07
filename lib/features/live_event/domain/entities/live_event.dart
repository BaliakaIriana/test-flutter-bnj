import 'package:equatable/equatable.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/product.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/seller.dart';

enum LiveEventStatus { scheduled, live, ended }

class LiveEvent extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime? endTime;
  final LiveEventStatus status;
  final Seller seller;
  final List<Product> products;
  final Product? featuredProduct;
  final int viewerCount;
  final String? streamUrl;
  final String? replayUrl;
  final String? thumbnailUrl;

  const LiveEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    this.endTime,
    required this.status,
    required this.seller,
    required this.products,
    this.featuredProduct,
    required this.viewerCount,
    this.streamUrl,
    this.thumbnailUrl,
    this.replayUrl,
  });

  @override
  List<Object?> get props => [id, title, status, seller, viewerCount];
}
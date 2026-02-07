import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/live_event.dart';
import '../../domain/entities/product.dart';
import 'product_model.dart';
import 'seller_model.dart';

part 'live_event_model.freezed.dart';
part 'live_event_model.g.dart';

@freezed
abstract class LiveEventModel with _$LiveEventModel {
  const factory LiveEventModel({
    required String id,
    required String title,
    required String description,
    required DateTime startTime,
    DateTime? endTime,
    required String status,
    required SellerModel seller,
    required List<String> products,
    String? featuredProduct,
    required int viewerCount,
    String? streamUrl,
    String? thumbnailUrl,
    String? replayUrl,
  }) = _LiveEventModel;

  factory LiveEventModel.fromJson(Map<String, dynamic> json) =>
      _$LiveEventModelFromJson(json);
}

extension LiveEventModelX on LiveEventModel {
  LiveEvent toEntity({
    List<Product> resolvedProducts = const [],
    Product? resolvedFeaturedProduct,
  }) {
    return LiveEvent(
      id: id,
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      status: _parseStatus(status),
      seller: seller.toEntity(),
      products: resolvedProducts,
      featuredProduct: resolvedFeaturedProduct,
      viewerCount: viewerCount,
      streamUrl: streamUrl,
      thumbnailUrl: thumbnailUrl,
      replayUrl: replayUrl,
    );
  }

  LiveEventStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'live':
        return LiveEventStatus.live;
      case 'ended':
        return LiveEventStatus.ended;
      default:
        return LiveEventStatus.scheduled;
    }
  }
}
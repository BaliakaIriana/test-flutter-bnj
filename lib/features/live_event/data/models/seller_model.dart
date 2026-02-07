import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/seller.dart';

part 'seller_model.freezed.dart';
part 'seller_model.g.dart';

@freezed
abstract class SellerModel with _$SellerModel {
  const factory SellerModel({
    required String id,
    required String name,
    required String storeName,
    required String avatar,
  }) = _SellerModel;

  factory SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);
}

extension SellerModelX on SellerModel {
  Seller toEntity() {
    return Seller(
      id: id,
      name: name,
      storeName: storeName,
      avatar: avatar,
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveEventModel {

 String get id; String get title; String get description; DateTime get startTime; DateTime? get endTime; String get status; SellerModel get seller; List<String> get products; String? get featuredProduct; int get viewerCount; String? get streamUrl; String? get thumbnailUrl; String? get replayUrl;
/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveEventModelCopyWith<LiveEventModel> get copyWith => _$LiveEventModelCopyWithImpl<LiveEventModel>(this as LiveEventModel, _$identity);

  /// Serializes this LiveEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.featuredProduct, featuredProduct) || other.featuredProduct == featuredProduct)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.streamUrl, streamUrl) || other.streamUrl == streamUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.replayUrl, replayUrl) || other.replayUrl == replayUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,status,seller,const DeepCollectionEquality().hash(products),featuredProduct,viewerCount,streamUrl,thumbnailUrl,replayUrl);

@override
String toString() {
  return 'LiveEventModel(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, status: $status, seller: $seller, products: $products, featuredProduct: $featuredProduct, viewerCount: $viewerCount, streamUrl: $streamUrl, thumbnailUrl: $thumbnailUrl, replayUrl: $replayUrl)';
}


}

/// @nodoc
abstract mixin class $LiveEventModelCopyWith<$Res>  {
  factory $LiveEventModelCopyWith(LiveEventModel value, $Res Function(LiveEventModel) _then) = _$LiveEventModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startTime, DateTime? endTime, String status, SellerModel seller, List<String> products, String? featuredProduct, int viewerCount, String? streamUrl, String? thumbnailUrl, String? replayUrl
});


$SellerModelCopyWith<$Res> get seller;

}
/// @nodoc
class _$LiveEventModelCopyWithImpl<$Res>
    implements $LiveEventModelCopyWith<$Res> {
  _$LiveEventModelCopyWithImpl(this._self, this._then);

  final LiveEventModel _self;
  final $Res Function(LiveEventModel) _then;

/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? seller = null,Object? products = null,Object? featuredProduct = freezed,Object? viewerCount = null,Object? streamUrl = freezed,Object? thumbnailUrl = freezed,Object? replayUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerModel,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<String>,featuredProduct: freezed == featuredProduct ? _self.featuredProduct : featuredProduct // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,streamUrl: freezed == streamUrl ? _self.streamUrl : streamUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,replayUrl: freezed == replayUrl ? _self.replayUrl : replayUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerModelCopyWith<$Res> get seller {
  
  return $SellerModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveEventModel].
extension LiveEventModelPatterns on LiveEventModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveEventModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveEventModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveEventModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveEventModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startTime,  DateTime? endTime,  String status,  SellerModel seller,  List<String> products,  String? featuredProduct,  int viewerCount,  String? streamUrl,  String? thumbnailUrl,  String? replayUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveEventModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.status,_that.seller,_that.products,_that.featuredProduct,_that.viewerCount,_that.streamUrl,_that.thumbnailUrl,_that.replayUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startTime,  DateTime? endTime,  String status,  SellerModel seller,  List<String> products,  String? featuredProduct,  int viewerCount,  String? streamUrl,  String? thumbnailUrl,  String? replayUrl)  $default,) {final _that = this;
switch (_that) {
case _LiveEventModel():
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.status,_that.seller,_that.products,_that.featuredProduct,_that.viewerCount,_that.streamUrl,_that.thumbnailUrl,_that.replayUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime startTime,  DateTime? endTime,  String status,  SellerModel seller,  List<String> products,  String? featuredProduct,  int viewerCount,  String? streamUrl,  String? thumbnailUrl,  String? replayUrl)?  $default,) {final _that = this;
switch (_that) {
case _LiveEventModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.status,_that.seller,_that.products,_that.featuredProduct,_that.viewerCount,_that.streamUrl,_that.thumbnailUrl,_that.replayUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveEventModel implements LiveEventModel {
  const _LiveEventModel({required this.id, required this.title, required this.description, required this.startTime, this.endTime, required this.status, required this.seller, required final  List<String> products, this.featuredProduct, required this.viewerCount, this.streamUrl, this.thumbnailUrl, this.replayUrl}): _products = products;
  factory _LiveEventModel.fromJson(Map<String, dynamic> json) => _$LiveEventModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override final  String status;
@override final  SellerModel seller;
 final  List<String> _products;
@override List<String> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  String? featuredProduct;
@override final  int viewerCount;
@override final  String? streamUrl;
@override final  String? thumbnailUrl;
@override final  String? replayUrl;

/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveEventModelCopyWith<_LiveEventModel> get copyWith => __$LiveEventModelCopyWithImpl<_LiveEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.featuredProduct, featuredProduct) || other.featuredProduct == featuredProduct)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.streamUrl, streamUrl) || other.streamUrl == streamUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.replayUrl, replayUrl) || other.replayUrl == replayUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,status,seller,const DeepCollectionEquality().hash(_products),featuredProduct,viewerCount,streamUrl,thumbnailUrl,replayUrl);

@override
String toString() {
  return 'LiveEventModel(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, status: $status, seller: $seller, products: $products, featuredProduct: $featuredProduct, viewerCount: $viewerCount, streamUrl: $streamUrl, thumbnailUrl: $thumbnailUrl, replayUrl: $replayUrl)';
}


}

/// @nodoc
abstract mixin class _$LiveEventModelCopyWith<$Res> implements $LiveEventModelCopyWith<$Res> {
  factory _$LiveEventModelCopyWith(_LiveEventModel value, $Res Function(_LiveEventModel) _then) = __$LiveEventModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startTime, DateTime? endTime, String status, SellerModel seller, List<String> products, String? featuredProduct, int viewerCount, String? streamUrl, String? thumbnailUrl, String? replayUrl
});


@override $SellerModelCopyWith<$Res> get seller;

}
/// @nodoc
class __$LiveEventModelCopyWithImpl<$Res>
    implements _$LiveEventModelCopyWith<$Res> {
  __$LiveEventModelCopyWithImpl(this._self, this._then);

  final _LiveEventModel _self;
  final $Res Function(_LiveEventModel) _then;

/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? seller = null,Object? products = null,Object? featuredProduct = freezed,Object? viewerCount = null,Object? streamUrl = freezed,Object? thumbnailUrl = freezed,Object? replayUrl = freezed,}) {
  return _then(_LiveEventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerModel,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<String>,featuredProduct: freezed == featuredProduct ? _self.featuredProduct : featuredProduct // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,streamUrl: freezed == streamUrl ? _self.streamUrl : streamUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,replayUrl: freezed == replayUrl ? _self.replayUrl : replayUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LiveEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerModelCopyWith<$Res> get seller {
  
  return $SellerModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 String get id; String get name; String get description; double get price; double? get salePrice; List<String> get images; String get thumbnail; int get stock; Map<String, List<String>>? get variations; bool get isFeatured; DateTime? get featuredAt; String get category; double get rating; int get reviewsCount;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.variations, variations)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.featuredAt, featuredAt) || other.featuredAt == featuredAt)&&(identical(other.category, category) || other.category == category)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,salePrice,const DeepCollectionEquality().hash(images),thumbnail,stock,const DeepCollectionEquality().hash(variations),isFeatured,featuredAt,category,rating,reviewsCount);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, salePrice: $salePrice, images: $images, thumbnail: $thumbnail, stock: $stock, variations: $variations, isFeatured: $isFeatured, featuredAt: $featuredAt, category: $category, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double price, double? salePrice, List<String> images, String thumbnail, int stock, Map<String, List<String>>? variations, bool isFeatured, DateTime? featuredAt, String category, double rating, int reviewsCount
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? salePrice = freezed,Object? images = null,Object? thumbnail = null,Object? stock = null,Object? variations = freezed,Object? isFeatured = null,Object? featuredAt = freezed,Object? category = null,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,salePrice: freezed == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,variations: freezed == variations ? _self.variations : variations // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,featuredAt: freezed == featuredAt ? _self.featuredAt : featuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  double? salePrice,  List<String> images,  String thumbnail,  int stock,  Map<String, List<String>>? variations,  bool isFeatured,  DateTime? featuredAt,  String category,  double rating,  int reviewsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.salePrice,_that.images,_that.thumbnail,_that.stock,_that.variations,_that.isFeatured,_that.featuredAt,_that.category,_that.rating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  double? salePrice,  List<String> images,  String thumbnail,  int stock,  Map<String, List<String>>? variations,  bool isFeatured,  DateTime? featuredAt,  String category,  double rating,  int reviewsCount)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.description,_that.price,_that.salePrice,_that.images,_that.thumbnail,_that.stock,_that.variations,_that.isFeatured,_that.featuredAt,_that.category,_that.rating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double price,  double? salePrice,  List<String> images,  String thumbnail,  int stock,  Map<String, List<String>>? variations,  bool isFeatured,  DateTime? featuredAt,  String category,  double rating,  int reviewsCount)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.salePrice,_that.images,_that.thumbnail,_that.stock,_that.variations,_that.isFeatured,_that.featuredAt,_that.category,_that.rating,_that.reviewsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({required this.id, required this.name, required this.description, required this.price, this.salePrice, required final  List<String> images, required this.thumbnail, required this.stock, final  Map<String, List<String>>? variations, required this.isFeatured, this.featuredAt, required this.category, required this.rating, required this.reviewsCount}): _images = images,_variations = variations;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double price;
@override final  double? salePrice;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String thumbnail;
@override final  int stock;
 final  Map<String, List<String>>? _variations;
@override Map<String, List<String>>? get variations {
  final value = _variations;
  if (value == null) return null;
  if (_variations is EqualUnmodifiableMapView) return _variations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool isFeatured;
@override final  DateTime? featuredAt;
@override final  String category;
@override final  double rating;
@override final  int reviewsCount;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other._variations, _variations)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.featuredAt, featuredAt) || other.featuredAt == featuredAt)&&(identical(other.category, category) || other.category == category)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,salePrice,const DeepCollectionEquality().hash(_images),thumbnail,stock,const DeepCollectionEquality().hash(_variations),isFeatured,featuredAt,category,rating,reviewsCount);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, salePrice: $salePrice, images: $images, thumbnail: $thumbnail, stock: $stock, variations: $variations, isFeatured: $isFeatured, featuredAt: $featuredAt, category: $category, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double price, double? salePrice, List<String> images, String thumbnail, int stock, Map<String, List<String>>? variations, bool isFeatured, DateTime? featuredAt, String category, double rating, int reviewsCount
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? salePrice = freezed,Object? images = null,Object? thumbnail = null,Object? stock = null,Object? variations = freezed,Object? isFeatured = null,Object? featuredAt = freezed,Object? category = null,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,salePrice: freezed == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,variations: freezed == variations ? _self._variations : variations // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,featuredAt: freezed == featuredAt ? _self.featuredAt : featuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

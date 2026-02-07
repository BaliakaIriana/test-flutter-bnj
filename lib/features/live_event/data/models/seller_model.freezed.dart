// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerModel {

 String get id; String get name; String get storeName; String get avatar;
/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerModelCopyWith<SellerModel> get copyWith => _$SellerModelCopyWithImpl<SellerModel>(this as SellerModel, _$identity);

  /// Serializes this SellerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,storeName,avatar);

@override
String toString() {
  return 'SellerModel(id: $id, name: $name, storeName: $storeName, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $SellerModelCopyWith<$Res>  {
  factory $SellerModelCopyWith(SellerModel value, $Res Function(SellerModel) _then) = _$SellerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String storeName, String avatar
});




}
/// @nodoc
class _$SellerModelCopyWithImpl<$Res>
    implements $SellerModelCopyWith<$Res> {
  _$SellerModelCopyWithImpl(this._self, this._then);

  final SellerModel _self;
  final $Res Function(SellerModel) _then;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? storeName = null,Object? avatar = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerModel].
extension SellerModelPatterns on SellerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String storeName,  String avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerModel() when $default != null:
return $default(_that.id,_that.name,_that.storeName,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String storeName,  String avatar)  $default,) {final _that = this;
switch (_that) {
case _SellerModel():
return $default(_that.id,_that.name,_that.storeName,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String storeName,  String avatar)?  $default,) {final _that = this;
switch (_that) {
case _SellerModel() when $default != null:
return $default(_that.id,_that.name,_that.storeName,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerModel implements SellerModel {
  const _SellerModel({required this.id, required this.name, required this.storeName, required this.avatar});
  factory _SellerModel.fromJson(Map<String, dynamic> json) => _$SellerModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String storeName;
@override final  String avatar;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerModelCopyWith<_SellerModel> get copyWith => __$SellerModelCopyWithImpl<_SellerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,storeName,avatar);

@override
String toString() {
  return 'SellerModel(id: $id, name: $name, storeName: $storeName, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$SellerModelCopyWith<$Res> implements $SellerModelCopyWith<$Res> {
  factory _$SellerModelCopyWith(_SellerModel value, $Res Function(_SellerModel) _then) = __$SellerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String storeName, String avatar
});




}
/// @nodoc
class __$SellerModelCopyWithImpl<$Res>
    implements _$SellerModelCopyWith<$Res> {
  __$SellerModelCopyWithImpl(this._self, this._then);

  final _SellerModel _self;
  final $Res Function(_SellerModel) _then;

/// Create a copy of SellerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? storeName = null,Object? avatar = null,}) {
  return _then(_SellerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatReplyModel {

 String get id; String get sender; String get message;
/// Create a copy of ChatReplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatReplyModelCopyWith<ChatReplyModel> get copyWith => _$ChatReplyModelCopyWithImpl<ChatReplyModel>(this as ChatReplyModel, _$identity);

  /// Serializes this ChatReplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,message);

@override
String toString() {
  return 'ChatReplyModel(id: $id, sender: $sender, message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatReplyModelCopyWith<$Res>  {
  factory $ChatReplyModelCopyWith(ChatReplyModel value, $Res Function(ChatReplyModel) _then) = _$ChatReplyModelCopyWithImpl;
@useResult
$Res call({
 String id, String sender, String message
});




}
/// @nodoc
class _$ChatReplyModelCopyWithImpl<$Res>
    implements $ChatReplyModelCopyWith<$Res> {
  _$ChatReplyModelCopyWithImpl(this._self, this._then);

  final ChatReplyModel _self;
  final $Res Function(ChatReplyModel) _then;

/// Create a copy of ChatReplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = null,Object? message = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatReplyModel].
extension ChatReplyModelPatterns on ChatReplyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatReplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatReplyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatReplyModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatReplyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatReplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatReplyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sender,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatReplyModel() when $default != null:
return $default(_that.id,_that.sender,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sender,  String message)  $default,) {final _that = this;
switch (_that) {
case _ChatReplyModel():
return $default(_that.id,_that.sender,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sender,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ChatReplyModel() when $default != null:
return $default(_that.id,_that.sender,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatReplyModel implements ChatReplyModel {
  const _ChatReplyModel({required this.id, required this.sender, required this.message});
  factory _ChatReplyModel.fromJson(Map<String, dynamic> json) => _$ChatReplyModelFromJson(json);

@override final  String id;
@override final  String sender;
@override final  String message;

/// Create a copy of ChatReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatReplyModelCopyWith<_ChatReplyModel> get copyWith => __$ChatReplyModelCopyWithImpl<_ChatReplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatReplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,message);

@override
String toString() {
  return 'ChatReplyModel(id: $id, sender: $sender, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ChatReplyModelCopyWith<$Res> implements $ChatReplyModelCopyWith<$Res> {
  factory _$ChatReplyModelCopyWith(_ChatReplyModel value, $Res Function(_ChatReplyModel) _then) = __$ChatReplyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String sender, String message
});




}
/// @nodoc
class __$ChatReplyModelCopyWithImpl<$Res>
    implements _$ChatReplyModelCopyWith<$Res> {
  __$ChatReplyModelCopyWithImpl(this._self, this._then);

  final _ChatReplyModel _self;
  final $Res Function(_ChatReplyModel) _then;

/// Create a copy of ChatReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = null,Object? message = null,}) {
  return _then(_ChatReplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatMessageModel {

 String get id; String get senderId; String get senderName; String get message; DateTime get timestamp; bool get isVendor; ChatReplyModel? get replyTo; List<String> get reactions;
/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageModelCopyWith<ChatMessageModel> get copyWith => _$ChatMessageModelCopyWithImpl<ChatMessageModel>(this as ChatMessageModel, _$identity);

  /// Serializes this ChatMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isVendor, isVendor) || other.isVendor == isVendor)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&const DeepCollectionEquality().equals(other.reactions, reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderName,message,timestamp,isVendor,replyTo,const DeepCollectionEquality().hash(reactions));

@override
String toString() {
  return 'ChatMessageModel(id: $id, senderId: $senderId, senderName: $senderName, message: $message, timestamp: $timestamp, isVendor: $isVendor, replyTo: $replyTo, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class $ChatMessageModelCopyWith<$Res>  {
  factory $ChatMessageModelCopyWith(ChatMessageModel value, $Res Function(ChatMessageModel) _then) = _$ChatMessageModelCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, String senderName, String message, DateTime timestamp, bool isVendor, ChatReplyModel? replyTo, List<String> reactions
});


$ChatReplyModelCopyWith<$Res>? get replyTo;

}
/// @nodoc
class _$ChatMessageModelCopyWithImpl<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._self, this._then);

  final ChatMessageModel _self;
  final $Res Function(ChatMessageModel) _then;

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? senderName = null,Object? message = null,Object? timestamp = null,Object? isVendor = null,Object? replyTo = freezed,Object? reactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,isVendor: null == isVendor ? _self.isVendor : isVendor // ignore: cast_nullable_to_non_nullable
as bool,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as ChatReplyModel?,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatReplyModelCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $ChatReplyModelCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessageModel].
extension ChatMessageModelPatterns on ChatMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderName,  String message,  DateTime timestamp,  bool isVendor,  ChatReplyModel? replyTo,  List<String> reactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
return $default(_that.id,_that.senderId,_that.senderName,_that.message,_that.timestamp,_that.isVendor,_that.replyTo,_that.reactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderName,  String message,  DateTime timestamp,  bool isVendor,  ChatReplyModel? replyTo,  List<String> reactions)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageModel():
return $default(_that.id,_that.senderId,_that.senderName,_that.message,_that.timestamp,_that.isVendor,_that.replyTo,_that.reactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderId,  String senderName,  String message,  DateTime timestamp,  bool isVendor,  ChatReplyModel? replyTo,  List<String> reactions)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
return $default(_that.id,_that.senderId,_that.senderName,_that.message,_that.timestamp,_that.isVendor,_that.replyTo,_that.reactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageModel implements ChatMessageModel {
  const _ChatMessageModel({required this.id, required this.senderId, required this.senderName, required this.message, required this.timestamp, required this.isVendor, this.replyTo, required final  List<String> reactions}): _reactions = reactions;
  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) => _$ChatMessageModelFromJson(json);

@override final  String id;
@override final  String senderId;
@override final  String senderName;
@override final  String message;
@override final  DateTime timestamp;
@override final  bool isVendor;
@override final  ChatReplyModel? replyTo;
 final  List<String> _reactions;
@override List<String> get reactions {
  if (_reactions is EqualUnmodifiableListView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactions);
}


/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageModelCopyWith<_ChatMessageModel> get copyWith => __$ChatMessageModelCopyWithImpl<_ChatMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isVendor, isVendor) || other.isVendor == isVendor)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&const DeepCollectionEquality().equals(other._reactions, _reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderName,message,timestamp,isVendor,replyTo,const DeepCollectionEquality().hash(_reactions));

@override
String toString() {
  return 'ChatMessageModel(id: $id, senderId: $senderId, senderName: $senderName, message: $message, timestamp: $timestamp, isVendor: $isVendor, replyTo: $replyTo, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageModelCopyWith<$Res> implements $ChatMessageModelCopyWith<$Res> {
  factory _$ChatMessageModelCopyWith(_ChatMessageModel value, $Res Function(_ChatMessageModel) _then) = __$ChatMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, String senderName, String message, DateTime timestamp, bool isVendor, ChatReplyModel? replyTo, List<String> reactions
});


@override $ChatReplyModelCopyWith<$Res>? get replyTo;

}
/// @nodoc
class __$ChatMessageModelCopyWithImpl<$Res>
    implements _$ChatMessageModelCopyWith<$Res> {
  __$ChatMessageModelCopyWithImpl(this._self, this._then);

  final _ChatMessageModel _self;
  final $Res Function(_ChatMessageModel) _then;

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? senderName = null,Object? message = null,Object? timestamp = null,Object? isVendor = null,Object? replyTo = freezed,Object? reactions = null,}) {
  return _then(_ChatMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,isVendor: null == isVendor ? _self.isVendor : isVendor // ignore: cast_nullable_to_non_nullable
as bool,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as ChatReplyModel?,reactions: null == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatReplyModelCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $ChatReplyModelCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}
}

// dart format on

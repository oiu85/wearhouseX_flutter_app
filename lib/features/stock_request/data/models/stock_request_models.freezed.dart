// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_request_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockRequestModel {

@JsonKey(name: 'id', fromJson: _intFromJson) int get id;@JsonKey(name: 'product_id', fromJson: _intFromJson) int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'quantity', fromJson: _intFromJson) int get quantity;@JsonKey(name: 'status') String get status;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of StockRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockRequestModelCopyWith<StockRequestModel> get copyWith => _$StockRequestModelCopyWithImpl<StockRequestModel>(this as StockRequestModel, _$identity);

  /// Serializes this StockRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,quantity,status,rejectionReason,createdAt);

@override
String toString() {
  return 'StockRequestModel(id: $id, productId: $productId, productName: $productName, quantity: $quantity, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StockRequestModelCopyWith<$Res>  {
  factory $StockRequestModelCopyWith(StockRequestModel value, $Res Function(StockRequestModel) _then) = _$StockRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _intFromJson) int id,@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'quantity', fromJson: _intFromJson) int quantity,@JsonKey(name: 'status') String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$StockRequestModelCopyWithImpl<$Res>
    implements $StockRequestModelCopyWith<$Res> {
  _$StockRequestModelCopyWithImpl(this._self, this._then);

  final StockRequestModel _self;
  final $Res Function(StockRequestModel) _then;

/// Create a copy of StockRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? quantity = null,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StockRequestModel].
extension StockRequestModelPatterns on StockRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _StockRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity', fromJson: _intFromJson)  int quantity, @JsonKey(name: 'status')  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockRequestModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.quantity,_that.status,_that.rejectionReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity', fromJson: _intFromJson)  int quantity, @JsonKey(name: 'status')  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _StockRequestModel():
return $default(_that.id,_that.productId,_that.productName,_that.quantity,_that.status,_that.rejectionReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity', fromJson: _intFromJson)  int quantity, @JsonKey(name: 'status')  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StockRequestModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.quantity,_that.status,_that.rejectionReason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockRequestModel implements StockRequestModel {
  const _StockRequestModel({@JsonKey(name: 'id', fromJson: _intFromJson) required this.id, @JsonKey(name: 'product_id', fromJson: _intFromJson) required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'quantity', fromJson: _intFromJson) required this.quantity, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'created_at') required this.createdAt});
  factory _StockRequestModel.fromJson(Map<String, dynamic> json) => _$StockRequestModelFromJson(json);

@override@JsonKey(name: 'id', fromJson: _intFromJson) final  int id;
@override@JsonKey(name: 'product_id', fromJson: _intFromJson) final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'quantity', fromJson: _intFromJson) final  int quantity;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of StockRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockRequestModelCopyWith<_StockRequestModel> get copyWith => __$StockRequestModelCopyWithImpl<_StockRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,quantity,status,rejectionReason,createdAt);

@override
String toString() {
  return 'StockRequestModel(id: $id, productId: $productId, productName: $productName, quantity: $quantity, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StockRequestModelCopyWith<$Res> implements $StockRequestModelCopyWith<$Res> {
  factory _$StockRequestModelCopyWith(_StockRequestModel value, $Res Function(_StockRequestModel) _then) = __$StockRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _intFromJson) int id,@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'quantity', fromJson: _intFromJson) int quantity,@JsonKey(name: 'status') String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$StockRequestModelCopyWithImpl<$Res>
    implements _$StockRequestModelCopyWith<$Res> {
  __$StockRequestModelCopyWithImpl(this._self, this._then);

  final _StockRequestModel _self;
  final $Res Function(_StockRequestModel) _then;

/// Create a copy of StockRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? quantity = null,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,}) {
  return _then(_StockRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

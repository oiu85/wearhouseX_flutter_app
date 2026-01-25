// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleItemModel {

@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(fromJson: _intFromJson) int get quantity;@JsonKey(fromJson: _doubleFromJson) double get price;@JsonKey(fromJson: _doubleFromJson) double get subtotal;
/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemModelCopyWith<SaleItemModel> get copyWith => _$SaleItemModelCopyWithImpl<SaleItemModel>(this as SaleItemModel, _$identity);

  /// Serializes this SaleItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItemModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItemModel(productId: $productId, productName: $productName, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $SaleItemModelCopyWith<$Res>  {
  factory $SaleItemModelCopyWith(SaleItemModel value, $Res Function(SaleItemModel) _then) = _$SaleItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(fromJson: _doubleFromJson) double subtotal
});




}
/// @nodoc
class _$SaleItemModelCopyWithImpl<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  _$SaleItemModelCopyWithImpl(this._self, this._then);

  final SaleItemModel _self;
  final $Res Function(SaleItemModel) _then;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleItemModel].
extension SaleItemModelPatterns on SaleItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItemModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel():
return $default(_that.productId,_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleItemModel implements SaleItemModel {
  const _SaleItemModel({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(fromJson: _intFromJson) required this.quantity, @JsonKey(fromJson: _doubleFromJson) required this.price, @JsonKey(fromJson: _doubleFromJson) required this.subtotal});
  factory _SaleItemModel.fromJson(Map<String, dynamic> json) => _$SaleItemModelFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(fromJson: _intFromJson) final  int quantity;
@override@JsonKey(fromJson: _doubleFromJson) final  double price;
@override@JsonKey(fromJson: _doubleFromJson) final  double subtotal;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemModelCopyWith<_SaleItemModel> get copyWith => __$SaleItemModelCopyWithImpl<_SaleItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItemModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItemModel(productId: $productId, productName: $productName, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$SaleItemModelCopyWith<$Res> implements $SaleItemModelCopyWith<$Res> {
  factory _$SaleItemModelCopyWith(_SaleItemModel value, $Res Function(_SaleItemModel) _then) = __$SaleItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(fromJson: _doubleFromJson) double subtotal
});




}
/// @nodoc
class __$SaleItemModelCopyWithImpl<$Res>
    implements _$SaleItemModelCopyWith<$Res> {
  __$SaleItemModelCopyWithImpl(this._self, this._then);

  final _SaleItemModel _self;
  final $Res Function(_SaleItemModel) _then;

/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_SaleItemModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SaleModel {

@JsonKey(name: 'id', fromJson: _intFromJson) int get id;@JsonKey(name: 'invoice_number') String get invoiceNumber;@JsonKey(name: 'customer_name') String get customerName;@JsonKey(name: 'total_amount', fromJson: _doubleFromJson) double get totalAmount;@JsonKey(name: 'created_at') String get createdAt; List<SaleItemModel> get items;
/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleModelCopyWith<SaleModel> get copyWith => _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,totalAmount,createdAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, totalAmount: $totalAmount, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res>  {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) = _$SaleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _intFromJson) int id,@JsonKey(name: 'invoice_number') String invoiceNumber,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'total_amount', fromJson: _doubleFromJson) double totalAmount,@JsonKey(name: 'created_at') String createdAt, List<SaleItemModel> items
});




}
/// @nodoc
class _$SaleModelCopyWithImpl<$Res>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? totalAmount = null,Object? createdAt = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'total_amount', fromJson: _doubleFromJson)  double totalAmount, @JsonKey(name: 'created_at')  String createdAt,  List<SaleItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.totalAmount,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'total_amount', fromJson: _doubleFromJson)  double totalAmount, @JsonKey(name: 'created_at')  String createdAt,  List<SaleItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _SaleModel():
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.totalAmount,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _intFromJson)  int id, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'total_amount', fromJson: _doubleFromJson)  double totalAmount, @JsonKey(name: 'created_at')  String createdAt,  List<SaleItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.totalAmount,_that.createdAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleModel implements SaleModel {
  const _SaleModel({@JsonKey(name: 'id', fromJson: _intFromJson) required this.id, @JsonKey(name: 'invoice_number') required this.invoiceNumber, @JsonKey(name: 'customer_name') required this.customerName, @JsonKey(name: 'total_amount', fromJson: _doubleFromJson) required this.totalAmount, @JsonKey(name: 'created_at') required this.createdAt, final  List<SaleItemModel> items = const []}): _items = items;
  factory _SaleModel.fromJson(Map<String, dynamic> json) => _$SaleModelFromJson(json);

@override@JsonKey(name: 'id', fromJson: _intFromJson) final  int id;
@override@JsonKey(name: 'invoice_number') final  String invoiceNumber;
@override@JsonKey(name: 'customer_name') final  String customerName;
@override@JsonKey(name: 'total_amount', fromJson: _doubleFromJson) final  double totalAmount;
@override@JsonKey(name: 'created_at') final  String createdAt;
 final  List<SaleItemModel> _items;
@override@JsonKey() List<SaleItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleModelCopyWith<_SaleModel> get copyWith => __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,totalAmount,createdAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, totalAmount: $totalAmount, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res> implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(_SaleModel value, $Res Function(_SaleModel) _then) = __$SaleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _intFromJson) int id,@JsonKey(name: 'invoice_number') String invoiceNumber,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'total_amount', fromJson: _doubleFromJson) double totalAmount,@JsonKey(name: 'created_at') String createdAt, List<SaleItemModel> items
});




}
/// @nodoc
class __$SaleModelCopyWithImpl<$Res>
    implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? totalAmount = null,Object? createdAt = null,Object? items = null,}) {
  return _then(_SaleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItemModel>,
  ));
}


}


/// @nodoc
mixin _$CreateSaleRequestModel {

@JsonKey(name: 'customer_name') String get customerName; List<CreateSaleItemRequestModel> get items;
/// Create a copy of CreateSaleRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSaleRequestModelCopyWith<CreateSaleRequestModel> get copyWith => _$CreateSaleRequestModelCopyWithImpl<CreateSaleRequestModel>(this as CreateSaleRequestModel, _$identity);

  /// Serializes this CreateSaleRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSaleRequestModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreateSaleRequestModel(customerName: $customerName, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreateSaleRequestModelCopyWith<$Res>  {
  factory $CreateSaleRequestModelCopyWith(CreateSaleRequestModel value, $Res Function(CreateSaleRequestModel) _then) = _$CreateSaleRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'customer_name') String customerName, List<CreateSaleItemRequestModel> items
});




}
/// @nodoc
class _$CreateSaleRequestModelCopyWithImpl<$Res>
    implements $CreateSaleRequestModelCopyWith<$Res> {
  _$CreateSaleRequestModelCopyWithImpl(this._self, this._then);

  final CreateSaleRequestModel _self;
  final $Res Function(CreateSaleRequestModel) _then;

/// Create a copy of CreateSaleRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = null,Object? items = null,}) {
  return _then(_self.copyWith(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CreateSaleItemRequestModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSaleRequestModel].
extension CreateSaleRequestModelPatterns on CreateSaleRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSaleRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSaleRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSaleRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateSaleRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSaleRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSaleRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_name')  String customerName,  List<CreateSaleItemRequestModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSaleRequestModel() when $default != null:
return $default(_that.customerName,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_name')  String customerName,  List<CreateSaleItemRequestModel> items)  $default,) {final _that = this;
switch (_that) {
case _CreateSaleRequestModel():
return $default(_that.customerName,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'customer_name')  String customerName,  List<CreateSaleItemRequestModel> items)?  $default,) {final _that = this;
switch (_that) {
case _CreateSaleRequestModel() when $default != null:
return $default(_that.customerName,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSaleRequestModel implements CreateSaleRequestModel {
  const _CreateSaleRequestModel({@JsonKey(name: 'customer_name') required this.customerName, required final  List<CreateSaleItemRequestModel> items}): _items = items;
  factory _CreateSaleRequestModel.fromJson(Map<String, dynamic> json) => _$CreateSaleRequestModelFromJson(json);

@override@JsonKey(name: 'customer_name') final  String customerName;
 final  List<CreateSaleItemRequestModel> _items;
@override List<CreateSaleItemRequestModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CreateSaleRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSaleRequestModelCopyWith<_CreateSaleRequestModel> get copyWith => __$CreateSaleRequestModelCopyWithImpl<_CreateSaleRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSaleRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSaleRequestModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreateSaleRequestModel(customerName: $customerName, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreateSaleRequestModelCopyWith<$Res> implements $CreateSaleRequestModelCopyWith<$Res> {
  factory _$CreateSaleRequestModelCopyWith(_CreateSaleRequestModel value, $Res Function(_CreateSaleRequestModel) _then) = __$CreateSaleRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'customer_name') String customerName, List<CreateSaleItemRequestModel> items
});




}
/// @nodoc
class __$CreateSaleRequestModelCopyWithImpl<$Res>
    implements _$CreateSaleRequestModelCopyWith<$Res> {
  __$CreateSaleRequestModelCopyWithImpl(this._self, this._then);

  final _CreateSaleRequestModel _self;
  final $Res Function(_CreateSaleRequestModel) _then;

/// Create a copy of CreateSaleRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = null,Object? items = null,}) {
  return _then(_CreateSaleRequestModel(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateSaleItemRequestModel>,
  ));
}


}


/// @nodoc
mixin _$CreateSaleItemRequestModel {

@JsonKey(name: 'product_id') int get productId;@JsonKey(fromJson: _intFromJson) int get quantity;
/// Create a copy of CreateSaleItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSaleItemRequestModelCopyWith<CreateSaleItemRequestModel> get copyWith => _$CreateSaleItemRequestModelCopyWithImpl<CreateSaleItemRequestModel>(this as CreateSaleItemRequestModel, _$identity);

  /// Serializes this CreateSaleItemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSaleItemRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString() {
  return 'CreateSaleItemRequestModel(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CreateSaleItemRequestModelCopyWith<$Res>  {
  factory $CreateSaleItemRequestModelCopyWith(CreateSaleItemRequestModel value, $Res Function(CreateSaleItemRequestModel) _then) = _$CreateSaleItemRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(fromJson: _intFromJson) int quantity
});




}
/// @nodoc
class _$CreateSaleItemRequestModelCopyWithImpl<$Res>
    implements $CreateSaleItemRequestModelCopyWith<$Res> {
  _$CreateSaleItemRequestModelCopyWithImpl(this._self, this._then);

  final CreateSaleItemRequestModel _self;
  final $Res Function(CreateSaleItemRequestModel) _then;

/// Create a copy of CreateSaleItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSaleItemRequestModel].
extension CreateSaleItemRequestModelPatterns on CreateSaleItemRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSaleItemRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSaleItemRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSaleItemRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(fromJson: _intFromJson)  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel() when $default != null:
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(fromJson: _intFromJson)  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel():
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(fromJson: _intFromJson)  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CreateSaleItemRequestModel() when $default != null:
return $default(_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSaleItemRequestModel implements CreateSaleItemRequestModel {
  const _CreateSaleItemRequestModel({@JsonKey(name: 'product_id') required this.productId, @JsonKey(fromJson: _intFromJson) required this.quantity});
  factory _CreateSaleItemRequestModel.fromJson(Map<String, dynamic> json) => _$CreateSaleItemRequestModelFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(fromJson: _intFromJson) final  int quantity;

/// Create a copy of CreateSaleItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSaleItemRequestModelCopyWith<_CreateSaleItemRequestModel> get copyWith => __$CreateSaleItemRequestModelCopyWithImpl<_CreateSaleItemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSaleItemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSaleItemRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString() {
  return 'CreateSaleItemRequestModel(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CreateSaleItemRequestModelCopyWith<$Res> implements $CreateSaleItemRequestModelCopyWith<$Res> {
  factory _$CreateSaleItemRequestModelCopyWith(_CreateSaleItemRequestModel value, $Res Function(_CreateSaleItemRequestModel) _then) = __$CreateSaleItemRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(fromJson: _intFromJson) int quantity
});




}
/// @nodoc
class __$CreateSaleItemRequestModelCopyWithImpl<$Res>
    implements _$CreateSaleItemRequestModelCopyWith<$Res> {
  __$CreateSaleItemRequestModelCopyWithImpl(this._self, this._then);

  final _CreateSaleItemRequestModel _self;
  final $Res Function(_CreateSaleItemRequestModel) _then;

/// Create a copy of CreateSaleItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_CreateSaleItemRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SaleStatisticsModel {

@JsonKey(name: 'all_time') AllTimeStatsModel get allTime; PeriodStatsModel get today; PeriodStatsModel get week; PeriodStatsModel get month;@JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) double get averageSaleAmount;@JsonKey(name: 'top_products') List<TopProductModel> get topProducts;
/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleStatisticsModelCopyWith<SaleStatisticsModel> get copyWith => _$SaleStatisticsModelCopyWithImpl<SaleStatisticsModel>(this as SaleStatisticsModel, _$identity);

  /// Serializes this SaleStatisticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleStatisticsModel&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.today, today) || other.today == today)&&(identical(other.week, week) || other.week == week)&&(identical(other.month, month) || other.month == month)&&(identical(other.averageSaleAmount, averageSaleAmount) || other.averageSaleAmount == averageSaleAmount)&&const DeepCollectionEquality().equals(other.topProducts, topProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allTime,today,week,month,averageSaleAmount,const DeepCollectionEquality().hash(topProducts));

@override
String toString() {
  return 'SaleStatisticsModel(allTime: $allTime, today: $today, week: $week, month: $month, averageSaleAmount: $averageSaleAmount, topProducts: $topProducts)';
}


}

/// @nodoc
abstract mixin class $SaleStatisticsModelCopyWith<$Res>  {
  factory $SaleStatisticsModelCopyWith(SaleStatisticsModel value, $Res Function(SaleStatisticsModel) _then) = _$SaleStatisticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'all_time') AllTimeStatsModel allTime, PeriodStatsModel today, PeriodStatsModel week, PeriodStatsModel month,@JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) double averageSaleAmount,@JsonKey(name: 'top_products') List<TopProductModel> topProducts
});


$AllTimeStatsModelCopyWith<$Res> get allTime;$PeriodStatsModelCopyWith<$Res> get today;$PeriodStatsModelCopyWith<$Res> get week;$PeriodStatsModelCopyWith<$Res> get month;

}
/// @nodoc
class _$SaleStatisticsModelCopyWithImpl<$Res>
    implements $SaleStatisticsModelCopyWith<$Res> {
  _$SaleStatisticsModelCopyWithImpl(this._self, this._then);

  final SaleStatisticsModel _self;
  final $Res Function(SaleStatisticsModel) _then;

/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allTime = null,Object? today = null,Object? week = null,Object? month = null,Object? averageSaleAmount = null,Object? topProducts = null,}) {
  return _then(_self.copyWith(
allTime: null == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as AllTimeStatsModel,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,averageSaleAmount: null == averageSaleAmount ? _self.averageSaleAmount : averageSaleAmount // ignore: cast_nullable_to_non_nullable
as double,topProducts: null == topProducts ? _self.topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProductModel>,
  ));
}
/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AllTimeStatsModelCopyWith<$Res> get allTime {
  
  return $AllTimeStatsModelCopyWith<$Res>(_self.allTime, (value) {
    return _then(_self.copyWith(allTime: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get today {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get week {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.week, (value) {
    return _then(_self.copyWith(week: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get month {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.month, (value) {
    return _then(_self.copyWith(month: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleStatisticsModel].
extension SaleStatisticsModelPatterns on SaleStatisticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleStatisticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleStatisticsModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleStatisticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleStatisticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_time')  AllTimeStatsModel allTime,  PeriodStatsModel today,  PeriodStatsModel week,  PeriodStatsModel month, @JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson)  double averageSaleAmount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleStatisticsModel() when $default != null:
return $default(_that.allTime,_that.today,_that.week,_that.month,_that.averageSaleAmount,_that.topProducts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_time')  AllTimeStatsModel allTime,  PeriodStatsModel today,  PeriodStatsModel week,  PeriodStatsModel month, @JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson)  double averageSaleAmount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts)  $default,) {final _that = this;
switch (_that) {
case _SaleStatisticsModel():
return $default(_that.allTime,_that.today,_that.week,_that.month,_that.averageSaleAmount,_that.topProducts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'all_time')  AllTimeStatsModel allTime,  PeriodStatsModel today,  PeriodStatsModel week,  PeriodStatsModel month, @JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson)  double averageSaleAmount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts)?  $default,) {final _that = this;
switch (_that) {
case _SaleStatisticsModel() when $default != null:
return $default(_that.allTime,_that.today,_that.week,_that.month,_that.averageSaleAmount,_that.topProducts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleStatisticsModel implements SaleStatisticsModel {
  const _SaleStatisticsModel({@JsonKey(name: 'all_time') required this.allTime, required this.today, required this.week, required this.month, @JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) required this.averageSaleAmount, @JsonKey(name: 'top_products') required final  List<TopProductModel> topProducts}): _topProducts = topProducts;
  factory _SaleStatisticsModel.fromJson(Map<String, dynamic> json) => _$SaleStatisticsModelFromJson(json);

@override@JsonKey(name: 'all_time') final  AllTimeStatsModel allTime;
@override final  PeriodStatsModel today;
@override final  PeriodStatsModel week;
@override final  PeriodStatsModel month;
@override@JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) final  double averageSaleAmount;
 final  List<TopProductModel> _topProducts;
@override@JsonKey(name: 'top_products') List<TopProductModel> get topProducts {
  if (_topProducts is EqualUnmodifiableListView) return _topProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topProducts);
}


/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleStatisticsModelCopyWith<_SaleStatisticsModel> get copyWith => __$SaleStatisticsModelCopyWithImpl<_SaleStatisticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleStatisticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleStatisticsModel&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.today, today) || other.today == today)&&(identical(other.week, week) || other.week == week)&&(identical(other.month, month) || other.month == month)&&(identical(other.averageSaleAmount, averageSaleAmount) || other.averageSaleAmount == averageSaleAmount)&&const DeepCollectionEquality().equals(other._topProducts, _topProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allTime,today,week,month,averageSaleAmount,const DeepCollectionEquality().hash(_topProducts));

@override
String toString() {
  return 'SaleStatisticsModel(allTime: $allTime, today: $today, week: $week, month: $month, averageSaleAmount: $averageSaleAmount, topProducts: $topProducts)';
}


}

/// @nodoc
abstract mixin class _$SaleStatisticsModelCopyWith<$Res> implements $SaleStatisticsModelCopyWith<$Res> {
  factory _$SaleStatisticsModelCopyWith(_SaleStatisticsModel value, $Res Function(_SaleStatisticsModel) _then) = __$SaleStatisticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'all_time') AllTimeStatsModel allTime, PeriodStatsModel today, PeriodStatsModel week, PeriodStatsModel month,@JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) double averageSaleAmount,@JsonKey(name: 'top_products') List<TopProductModel> topProducts
});


@override $AllTimeStatsModelCopyWith<$Res> get allTime;@override $PeriodStatsModelCopyWith<$Res> get today;@override $PeriodStatsModelCopyWith<$Res> get week;@override $PeriodStatsModelCopyWith<$Res> get month;

}
/// @nodoc
class __$SaleStatisticsModelCopyWithImpl<$Res>
    implements _$SaleStatisticsModelCopyWith<$Res> {
  __$SaleStatisticsModelCopyWithImpl(this._self, this._then);

  final _SaleStatisticsModel _self;
  final $Res Function(_SaleStatisticsModel) _then;

/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allTime = null,Object? today = null,Object? week = null,Object? month = null,Object? averageSaleAmount = null,Object? topProducts = null,}) {
  return _then(_SaleStatisticsModel(
allTime: null == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as AllTimeStatsModel,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,averageSaleAmount: null == averageSaleAmount ? _self.averageSaleAmount : averageSaleAmount // ignore: cast_nullable_to_non_nullable
as double,topProducts: null == topProducts ? _self._topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProductModel>,
  ));
}

/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AllTimeStatsModelCopyWith<$Res> get allTime {
  
  return $AllTimeStatsModelCopyWith<$Res>(_self.allTime, (value) {
    return _then(_self.copyWith(allTime: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get today {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get week {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.week, (value) {
    return _then(_self.copyWith(week: value));
  });
}/// Create a copy of SaleStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get month {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.month, (value) {
    return _then(_self.copyWith(month: value));
  });
}
}


/// @nodoc
mixin _$AllTimeStatsModel {

@JsonKey(name: 'total_sales', fromJson: _intFromJson) int get totalSales;@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double get totalRevenue;
/// Create a copy of AllTimeStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllTimeStatsModelCopyWith<AllTimeStatsModel> get copyWith => _$AllTimeStatsModelCopyWithImpl<AllTimeStatsModel>(this as AllTimeStatsModel, _$identity);

  /// Serializes this AllTimeStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllTimeStatsModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalRevenue);

@override
String toString() {
  return 'AllTimeStatsModel(totalSales: $totalSales, totalRevenue: $totalRevenue)';
}


}

/// @nodoc
abstract mixin class $AllTimeStatsModelCopyWith<$Res>  {
  factory $AllTimeStatsModelCopyWith(AllTimeStatsModel value, $Res Function(AllTimeStatsModel) _then) = _$AllTimeStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_sales', fromJson: _intFromJson) int totalSales,@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double totalRevenue
});




}
/// @nodoc
class _$AllTimeStatsModelCopyWithImpl<$Res>
    implements $AllTimeStatsModelCopyWith<$Res> {
  _$AllTimeStatsModelCopyWithImpl(this._self, this._then);

  final AllTimeStatsModel _self;
  final $Res Function(AllTimeStatsModel) _then;

/// Create a copy of AllTimeStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSales = null,Object? totalRevenue = null,}) {
  return _then(_self.copyWith(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AllTimeStatsModel].
extension AllTimeStatsModelPatterns on AllTimeStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllTimeStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllTimeStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllTimeStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _AllTimeStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllTimeStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AllTimeStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllTimeStatsModel() when $default != null:
return $default(_that.totalSales,_that.totalRevenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue)  $default,) {final _that = this;
switch (_that) {
case _AllTimeStatsModel():
return $default(_that.totalSales,_that.totalRevenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue)?  $default,) {final _that = this;
switch (_that) {
case _AllTimeStatsModel() when $default != null:
return $default(_that.totalSales,_that.totalRevenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllTimeStatsModel implements AllTimeStatsModel {
  const _AllTimeStatsModel({@JsonKey(name: 'total_sales', fromJson: _intFromJson) required this.totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) required this.totalRevenue});
  factory _AllTimeStatsModel.fromJson(Map<String, dynamic> json) => _$AllTimeStatsModelFromJson(json);

@override@JsonKey(name: 'total_sales', fromJson: _intFromJson) final  int totalSales;
@override@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) final  double totalRevenue;

/// Create a copy of AllTimeStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllTimeStatsModelCopyWith<_AllTimeStatsModel> get copyWith => __$AllTimeStatsModelCopyWithImpl<_AllTimeStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllTimeStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllTimeStatsModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalRevenue);

@override
String toString() {
  return 'AllTimeStatsModel(totalSales: $totalSales, totalRevenue: $totalRevenue)';
}


}

/// @nodoc
abstract mixin class _$AllTimeStatsModelCopyWith<$Res> implements $AllTimeStatsModelCopyWith<$Res> {
  factory _$AllTimeStatsModelCopyWith(_AllTimeStatsModel value, $Res Function(_AllTimeStatsModel) _then) = __$AllTimeStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_sales', fromJson: _intFromJson) int totalSales,@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double totalRevenue
});




}
/// @nodoc
class __$AllTimeStatsModelCopyWithImpl<$Res>
    implements _$AllTimeStatsModelCopyWith<$Res> {
  __$AllTimeStatsModelCopyWithImpl(this._self, this._then);

  final _AllTimeStatsModel _self;
  final $Res Function(_AllTimeStatsModel) _then;

/// Create a copy of AllTimeStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalRevenue = null,}) {
  return _then(_AllTimeStatsModel(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PeriodStatsModel {

@JsonKey(name: 'sales_count', fromJson: _intFromJson) int get salesCount;@JsonKey(fromJson: _doubleFromJson) double get revenue;
/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<PeriodStatsModel> get copyWith => _$PeriodStatsModelCopyWithImpl<PeriodStatsModel>(this as PeriodStatsModel, _$identity);

  /// Serializes this PeriodStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodStatsModel&&(identical(other.salesCount, salesCount) || other.salesCount == salesCount)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesCount,revenue);

@override
String toString() {
  return 'PeriodStatsModel(salesCount: $salesCount, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $PeriodStatsModelCopyWith<$Res>  {
  factory $PeriodStatsModelCopyWith(PeriodStatsModel value, $Res Function(PeriodStatsModel) _then) = _$PeriodStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sales_count', fromJson: _intFromJson) int salesCount,@JsonKey(fromJson: _doubleFromJson) double revenue
});




}
/// @nodoc
class _$PeriodStatsModelCopyWithImpl<$Res>
    implements $PeriodStatsModelCopyWith<$Res> {
  _$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final PeriodStatsModel _self;
  final $Res Function(PeriodStatsModel) _then;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesCount = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodStatsModel].
extension PeriodStatsModelPatterns on PeriodStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _PeriodStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sales_count', fromJson: _intFromJson)  int salesCount, @JsonKey(fromJson: _doubleFromJson)  double revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
return $default(_that.salesCount,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sales_count', fromJson: _intFromJson)  int salesCount, @JsonKey(fromJson: _doubleFromJson)  double revenue)  $default,) {final _that = this;
switch (_that) {
case _PeriodStatsModel():
return $default(_that.salesCount,_that.revenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sales_count', fromJson: _intFromJson)  int salesCount, @JsonKey(fromJson: _doubleFromJson)  double revenue)?  $default,) {final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
return $default(_that.salesCount,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodStatsModel implements PeriodStatsModel {
  const _PeriodStatsModel({@JsonKey(name: 'sales_count', fromJson: _intFromJson) required this.salesCount, @JsonKey(fromJson: _doubleFromJson) required this.revenue});
  factory _PeriodStatsModel.fromJson(Map<String, dynamic> json) => _$PeriodStatsModelFromJson(json);

@override@JsonKey(name: 'sales_count', fromJson: _intFromJson) final  int salesCount;
@override@JsonKey(fromJson: _doubleFromJson) final  double revenue;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodStatsModelCopyWith<_PeriodStatsModel> get copyWith => __$PeriodStatsModelCopyWithImpl<_PeriodStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodStatsModel&&(identical(other.salesCount, salesCount) || other.salesCount == salesCount)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesCount,revenue);

@override
String toString() {
  return 'PeriodStatsModel(salesCount: $salesCount, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$PeriodStatsModelCopyWith<$Res> implements $PeriodStatsModelCopyWith<$Res> {
  factory _$PeriodStatsModelCopyWith(_PeriodStatsModel value, $Res Function(_PeriodStatsModel) _then) = __$PeriodStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sales_count', fromJson: _intFromJson) int salesCount,@JsonKey(fromJson: _doubleFromJson) double revenue
});




}
/// @nodoc
class __$PeriodStatsModelCopyWithImpl<$Res>
    implements _$PeriodStatsModelCopyWith<$Res> {
  __$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final _PeriodStatsModel _self;
  final $Res Function(_PeriodStatsModel) _then;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesCount = null,Object? revenue = null,}) {
  return _then(_PeriodStatsModel(
salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TopProductModel {

@JsonKey(name: 'product_id', fromJson: _intFromJson) int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'quantity_sold', fromJson: _intFromJson) int get quantitySold;@JsonKey(fromJson: _doubleFromJson) double get revenue;
/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopProductModelCopyWith<TopProductModel> get copyWith => _$TopProductModelCopyWithImpl<TopProductModel>(this as TopProductModel, _$identity);

  /// Serializes this TopProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantitySold,revenue);

@override
String toString() {
  return 'TopProductModel(productId: $productId, productName: $productName, quantitySold: $quantitySold, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $TopProductModelCopyWith<$Res>  {
  factory $TopProductModelCopyWith(TopProductModel value, $Res Function(TopProductModel) _then) = _$TopProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'quantity_sold', fromJson: _intFromJson) int quantitySold,@JsonKey(fromJson: _doubleFromJson) double revenue
});




}
/// @nodoc
class _$TopProductModelCopyWithImpl<$Res>
    implements $TopProductModelCopyWith<$Res> {
  _$TopProductModelCopyWithImpl(this._self, this._then);

  final TopProductModel _self;
  final $Res Function(TopProductModel) _then;

/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? quantitySold = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopProductModel].
extension TopProductModelPatterns on TopProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopProductModel value)  $default,){
final _that = this;
switch (_that) {
case _TopProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity_sold', fromJson: _intFromJson)  int quantitySold, @JsonKey(fromJson: _doubleFromJson)  double revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantitySold,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity_sold', fromJson: _intFromJson)  int quantitySold, @JsonKey(fromJson: _doubleFromJson)  double revenue)  $default,) {final _that = this;
switch (_that) {
case _TopProductModel():
return $default(_that.productId,_that.productName,_that.quantitySold,_that.revenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'quantity_sold', fromJson: _intFromJson)  int quantitySold, @JsonKey(fromJson: _doubleFromJson)  double revenue)?  $default,) {final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantitySold,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopProductModel implements TopProductModel {
  const _TopProductModel({@JsonKey(name: 'product_id', fromJson: _intFromJson) required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'quantity_sold', fromJson: _intFromJson) required this.quantitySold, @JsonKey(fromJson: _doubleFromJson) required this.revenue});
  factory _TopProductModel.fromJson(Map<String, dynamic> json) => _$TopProductModelFromJson(json);

@override@JsonKey(name: 'product_id', fromJson: _intFromJson) final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'quantity_sold', fromJson: _intFromJson) final  int quantitySold;
@override@JsonKey(fromJson: _doubleFromJson) final  double revenue;

/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopProductModelCopyWith<_TopProductModel> get copyWith => __$TopProductModelCopyWithImpl<_TopProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantitySold,revenue);

@override
String toString() {
  return 'TopProductModel(productId: $productId, productName: $productName, quantitySold: $quantitySold, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$TopProductModelCopyWith<$Res> implements $TopProductModelCopyWith<$Res> {
  factory _$TopProductModelCopyWith(_TopProductModel value, $Res Function(_TopProductModel) _then) = __$TopProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'quantity_sold', fromJson: _intFromJson) int quantitySold,@JsonKey(fromJson: _doubleFromJson) double revenue
});




}
/// @nodoc
class __$TopProductModelCopyWithImpl<$Res>
    implements _$TopProductModelCopyWith<$Res> {
  __$TopProductModelCopyWithImpl(this._self, this._then);

  final _TopProductModel _self;
  final $Res Function(_TopProductModel) _then;

/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? quantitySold = null,Object? revenue = null,}) {
  return _then(_TopProductModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

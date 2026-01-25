// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverStatsModel {

@JsonKey(name: 'total_sales', fromJson: _intFromJson) int get totalSales;@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double get totalRevenue;@JsonKey(name: 'today_sales', fromJson: _intFromJson) int get todaySales;@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double get todayRevenue;@JsonKey(name: 'total_stock_items', fromJson: _intFromJson) int get totalStockItems;@JsonKey(name: 'recent_sales') List<SaleModel> get recentSales;
/// Create a copy of DriverStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverStatsModelCopyWith<DriverStatsModel> get copyWith => _$DriverStatsModelCopyWithImpl<DriverStatsModel>(this as DriverStatsModel, _$identity);

  /// Serializes this DriverStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverStatsModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalStockItems, totalStockItems) || other.totalStockItems == totalStockItems)&&const DeepCollectionEquality().equals(other.recentSales, recentSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalRevenue,todaySales,todayRevenue,totalStockItems,const DeepCollectionEquality().hash(recentSales));

@override
String toString() {
  return 'DriverStatsModel(totalSales: $totalSales, totalRevenue: $totalRevenue, todaySales: $todaySales, todayRevenue: $todayRevenue, totalStockItems: $totalStockItems, recentSales: $recentSales)';
}


}

/// @nodoc
abstract mixin class $DriverStatsModelCopyWith<$Res>  {
  factory $DriverStatsModelCopyWith(DriverStatsModel value, $Res Function(DriverStatsModel) _then) = _$DriverStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_sales', fromJson: _intFromJson) int totalSales,@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double totalRevenue,@JsonKey(name: 'today_sales', fromJson: _intFromJson) int todaySales,@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double todayRevenue,@JsonKey(name: 'total_stock_items', fromJson: _intFromJson) int totalStockItems,@JsonKey(name: 'recent_sales') List<SaleModel> recentSales
});




}
/// @nodoc
class _$DriverStatsModelCopyWithImpl<$Res>
    implements $DriverStatsModelCopyWith<$Res> {
  _$DriverStatsModelCopyWithImpl(this._self, this._then);

  final DriverStatsModel _self;
  final $Res Function(DriverStatsModel) _then;

/// Create a copy of DriverStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSales = null,Object? totalRevenue = null,Object? todaySales = null,Object? todayRevenue = null,Object? totalStockItems = null,Object? recentSales = null,}) {
  return _then(_self.copyWith(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,totalStockItems: null == totalStockItems ? _self.totalStockItems : totalStockItems // ignore: cast_nullable_to_non_nullable
as int,recentSales: null == recentSales ? _self.recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverStatsModel].
extension DriverStatsModelPatterns on DriverStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue, @JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'total_stock_items', fromJson: _intFromJson)  int totalStockItems, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverStatsModel() when $default != null:
return $default(_that.totalSales,_that.totalRevenue,_that.todaySales,_that.todayRevenue,_that.totalStockItems,_that.recentSales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue, @JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'total_stock_items', fromJson: _intFromJson)  int totalStockItems, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales)  $default,) {final _that = this;
switch (_that) {
case _DriverStatsModel():
return $default(_that.totalSales,_that.totalRevenue,_that.todaySales,_that.todayRevenue,_that.totalStockItems,_that.recentSales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_sales', fromJson: _intFromJson)  int totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)  double totalRevenue, @JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'total_stock_items', fromJson: _intFromJson)  int totalStockItems, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales)?  $default,) {final _that = this;
switch (_that) {
case _DriverStatsModel() when $default != null:
return $default(_that.totalSales,_that.totalRevenue,_that.todaySales,_that.todayRevenue,_that.totalStockItems,_that.recentSales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverStatsModel implements DriverStatsModel {
  const _DriverStatsModel({@JsonKey(name: 'total_sales', fromJson: _intFromJson) required this.totalSales, @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) required this.totalRevenue, @JsonKey(name: 'today_sales', fromJson: _intFromJson) required this.todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) required this.todayRevenue, @JsonKey(name: 'total_stock_items', fromJson: _intFromJson) required this.totalStockItems, @JsonKey(name: 'recent_sales') final  List<SaleModel> recentSales = const []}): _recentSales = recentSales;
  factory _DriverStatsModel.fromJson(Map<String, dynamic> json) => _$DriverStatsModelFromJson(json);

@override@JsonKey(name: 'total_sales', fromJson: _intFromJson) final  int totalSales;
@override@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) final  double totalRevenue;
@override@JsonKey(name: 'today_sales', fromJson: _intFromJson) final  int todaySales;
@override@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) final  double todayRevenue;
@override@JsonKey(name: 'total_stock_items', fromJson: _intFromJson) final  int totalStockItems;
 final  List<SaleModel> _recentSales;
@override@JsonKey(name: 'recent_sales') List<SaleModel> get recentSales {
  if (_recentSales is EqualUnmodifiableListView) return _recentSales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSales);
}


/// Create a copy of DriverStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverStatsModelCopyWith<_DriverStatsModel> get copyWith => __$DriverStatsModelCopyWithImpl<_DriverStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverStatsModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalStockItems, totalStockItems) || other.totalStockItems == totalStockItems)&&const DeepCollectionEquality().equals(other._recentSales, _recentSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalRevenue,todaySales,todayRevenue,totalStockItems,const DeepCollectionEquality().hash(_recentSales));

@override
String toString() {
  return 'DriverStatsModel(totalSales: $totalSales, totalRevenue: $totalRevenue, todaySales: $todaySales, todayRevenue: $todayRevenue, totalStockItems: $totalStockItems, recentSales: $recentSales)';
}


}

/// @nodoc
abstract mixin class _$DriverStatsModelCopyWith<$Res> implements $DriverStatsModelCopyWith<$Res> {
  factory _$DriverStatsModelCopyWith(_DriverStatsModel value, $Res Function(_DriverStatsModel) _then) = __$DriverStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_sales', fromJson: _intFromJson) int totalSales,@JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) double totalRevenue,@JsonKey(name: 'today_sales', fromJson: _intFromJson) int todaySales,@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double todayRevenue,@JsonKey(name: 'total_stock_items', fromJson: _intFromJson) int totalStockItems,@JsonKey(name: 'recent_sales') List<SaleModel> recentSales
});




}
/// @nodoc
class __$DriverStatsModelCopyWithImpl<$Res>
    implements _$DriverStatsModelCopyWith<$Res> {
  __$DriverStatsModelCopyWithImpl(this._self, this._then);

  final _DriverStatsModel _self;
  final $Res Function(_DriverStatsModel) _then;

/// Create a copy of DriverStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalRevenue = null,Object? todaySales = null,Object? todayRevenue = null,Object? totalStockItems = null,Object? recentSales = null,}) {
  return _then(_DriverStatsModel(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,totalStockItems: null == totalStockItems ? _self.totalStockItems : totalStockItems // ignore: cast_nullable_to_non_nullable
as int,recentSales: null == recentSales ? _self._recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,
  ));
}


}


/// @nodoc
mixin _$SaleItemModel {

@JsonKey(name: 'product_name') String get productName;@JsonKey(fromJson: _intFromJson) int get quantity;@JsonKey(fromJson: _doubleFromJson) double get price;@JsonKey(fromJson: _doubleFromJson) double get subtotal;
/// Create a copy of SaleItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemModelCopyWith<SaleItemModel> get copyWith => _$SaleItemModelCopyWithImpl<SaleItemModel>(this as SaleItemModel, _$identity);

  /// Serializes this SaleItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItemModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItemModel(productName: $productName, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $SaleItemModelCopyWith<$Res>  {
  factory $SaleItemModelCopyWith(SaleItemModel value, $Res Function(SaleItemModel) _then) = _$SaleItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_name') String productName,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(fromJson: _doubleFromJson) double subtotal
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
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel():
return $default(_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_name')  String productName, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(fromJson: _doubleFromJson)  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _SaleItemModel() when $default != null:
return $default(_that.productName,_that.quantity,_that.price,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleItemModel implements SaleItemModel {
  const _SaleItemModel({@JsonKey(name: 'product_name') required this.productName, @JsonKey(fromJson: _intFromJson) required this.quantity, @JsonKey(fromJson: _doubleFromJson) required this.price, @JsonKey(fromJson: _doubleFromJson) required this.subtotal});
  factory _SaleItemModel.fromJson(Map<String, dynamic> json) => _$SaleItemModelFromJson(json);

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItemModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItemModel(productName: $productName, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$SaleItemModelCopyWith<$Res> implements $SaleItemModelCopyWith<$Res> {
  factory _$SaleItemModelCopyWith(_SaleItemModel value, $Res Function(_SaleItemModel) _then) = __$SaleItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_name') String productName,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(fromJson: _doubleFromJson) double subtotal
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
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_SaleItemModel(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
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
mixin _$DashboardModel {

@JsonKey(name: 'quick_stats') QuickStatsModel get quickStats;@JsonKey(name: 'recent_sales') List<SaleModel> get recentSales;@JsonKey(name: 'low_stock_products') List<LowStockProductModel> get lowStockProducts;
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardModelCopyWith<DashboardModel> get copyWith => _$DashboardModelCopyWithImpl<DashboardModel>(this as DashboardModel, _$identity);

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardModel&&(identical(other.quickStats, quickStats) || other.quickStats == quickStats)&&const DeepCollectionEquality().equals(other.recentSales, recentSales)&&const DeepCollectionEquality().equals(other.lowStockProducts, lowStockProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickStats,const DeepCollectionEquality().hash(recentSales),const DeepCollectionEquality().hash(lowStockProducts));

@override
String toString() {
  return 'DashboardModel(quickStats: $quickStats, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
}


}

/// @nodoc
abstract mixin class $DashboardModelCopyWith<$Res>  {
  factory $DashboardModelCopyWith(DashboardModel value, $Res Function(DashboardModel) _then) = _$DashboardModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'quick_stats') QuickStatsModel quickStats,@JsonKey(name: 'recent_sales') List<SaleModel> recentSales,@JsonKey(name: 'low_stock_products') List<LowStockProductModel> lowStockProducts
});


$QuickStatsModelCopyWith<$Res> get quickStats;

}
/// @nodoc
class _$DashboardModelCopyWithImpl<$Res>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._self, this._then);

  final DashboardModel _self;
  final $Res Function(DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quickStats = null,Object? recentSales = null,Object? lowStockProducts = null,}) {
  return _then(_self.copyWith(
quickStats: null == quickStats ? _self.quickStats : quickStats // ignore: cast_nullable_to_non_nullable
as QuickStatsModel,recentSales: null == recentSales ? _self.recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,lowStockProducts: null == lowStockProducts ? _self.lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProductModel>,
  ));
}
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuickStatsModelCopyWith<$Res> get quickStats {
  
  return $QuickStatsModelCopyWith<$Res>(_self.quickStats, (value) {
    return _then(_self.copyWith(quickStats: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardModel].
extension DashboardModelPatterns on DashboardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_stats')  QuickStatsModel quickStats, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales, @JsonKey(name: 'low_stock_products')  List<LowStockProductModel> lowStockProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.quickStats,_that.recentSales,_that.lowStockProducts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_stats')  QuickStatsModel quickStats, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales, @JsonKey(name: 'low_stock_products')  List<LowStockProductModel> lowStockProducts)  $default,) {final _that = this;
switch (_that) {
case _DashboardModel():
return $default(_that.quickStats,_that.recentSales,_that.lowStockProducts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'quick_stats')  QuickStatsModel quickStats, @JsonKey(name: 'recent_sales')  List<SaleModel> recentSales, @JsonKey(name: 'low_stock_products')  List<LowStockProductModel> lowStockProducts)?  $default,) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.quickStats,_that.recentSales,_that.lowStockProducts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardModel implements DashboardModel {
  const _DashboardModel({@JsonKey(name: 'quick_stats') required this.quickStats, @JsonKey(name: 'recent_sales') final  List<SaleModel> recentSales = const [], @JsonKey(name: 'low_stock_products') final  List<LowStockProductModel> lowStockProducts = const []}): _recentSales = recentSales,_lowStockProducts = lowStockProducts;
  factory _DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

@override@JsonKey(name: 'quick_stats') final  QuickStatsModel quickStats;
 final  List<SaleModel> _recentSales;
@override@JsonKey(name: 'recent_sales') List<SaleModel> get recentSales {
  if (_recentSales is EqualUnmodifiableListView) return _recentSales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSales);
}

 final  List<LowStockProductModel> _lowStockProducts;
@override@JsonKey(name: 'low_stock_products') List<LowStockProductModel> get lowStockProducts {
  if (_lowStockProducts is EqualUnmodifiableListView) return _lowStockProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStockProducts);
}


/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardModelCopyWith<_DashboardModel> get copyWith => __$DashboardModelCopyWithImpl<_DashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardModel&&(identical(other.quickStats, quickStats) || other.quickStats == quickStats)&&const DeepCollectionEquality().equals(other._recentSales, _recentSales)&&const DeepCollectionEquality().equals(other._lowStockProducts, _lowStockProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickStats,const DeepCollectionEquality().hash(_recentSales),const DeepCollectionEquality().hash(_lowStockProducts));

@override
String toString() {
  return 'DashboardModel(quickStats: $quickStats, recentSales: $recentSales, lowStockProducts: $lowStockProducts)';
}


}

/// @nodoc
abstract mixin class _$DashboardModelCopyWith<$Res> implements $DashboardModelCopyWith<$Res> {
  factory _$DashboardModelCopyWith(_DashboardModel value, $Res Function(_DashboardModel) _then) = __$DashboardModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'quick_stats') QuickStatsModel quickStats,@JsonKey(name: 'recent_sales') List<SaleModel> recentSales,@JsonKey(name: 'low_stock_products') List<LowStockProductModel> lowStockProducts
});


@override $QuickStatsModelCopyWith<$Res> get quickStats;

}
/// @nodoc
class __$DashboardModelCopyWithImpl<$Res>
    implements _$DashboardModelCopyWith<$Res> {
  __$DashboardModelCopyWithImpl(this._self, this._then);

  final _DashboardModel _self;
  final $Res Function(_DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quickStats = null,Object? recentSales = null,Object? lowStockProducts = null,}) {
  return _then(_DashboardModel(
quickStats: null == quickStats ? _self.quickStats : quickStats // ignore: cast_nullable_to_non_nullable
as QuickStatsModel,recentSales: null == recentSales ? _self._recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,lowStockProducts: null == lowStockProducts ? _self._lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProductModel>,
  ));
}

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuickStatsModelCopyWith<$Res> get quickStats {
  
  return $QuickStatsModelCopyWith<$Res>(_self.quickStats, (value) {
    return _then(_self.copyWith(quickStats: value));
  });
}
}


/// @nodoc
mixin _$QuickStatsModel {

@JsonKey(name: 'today_sales', fromJson: _intFromJson) int get todaySales;@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double get todayRevenue;@JsonKey(name: 'available_products', fromJson: _intFromJson) int get availableProducts;@JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) int get lowStockAlerts;
/// Create a copy of QuickStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickStatsModelCopyWith<QuickStatsModel> get copyWith => _$QuickStatsModelCopyWithImpl<QuickStatsModel>(this as QuickStatsModel, _$identity);

  /// Serializes this QuickStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickStatsModel&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.availableProducts, availableProducts) || other.availableProducts == availableProducts)&&(identical(other.lowStockAlerts, lowStockAlerts) || other.lowStockAlerts == lowStockAlerts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todaySales,todayRevenue,availableProducts,lowStockAlerts);

@override
String toString() {
  return 'QuickStatsModel(todaySales: $todaySales, todayRevenue: $todayRevenue, availableProducts: $availableProducts, lowStockAlerts: $lowStockAlerts)';
}


}

/// @nodoc
abstract mixin class $QuickStatsModelCopyWith<$Res>  {
  factory $QuickStatsModelCopyWith(QuickStatsModel value, $Res Function(QuickStatsModel) _then) = _$QuickStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'today_sales', fromJson: _intFromJson) int todaySales,@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double todayRevenue,@JsonKey(name: 'available_products', fromJson: _intFromJson) int availableProducts,@JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) int lowStockAlerts
});




}
/// @nodoc
class _$QuickStatsModelCopyWithImpl<$Res>
    implements $QuickStatsModelCopyWith<$Res> {
  _$QuickStatsModelCopyWithImpl(this._self, this._then);

  final QuickStatsModel _self;
  final $Res Function(QuickStatsModel) _then;

/// Create a copy of QuickStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todaySales = null,Object? todayRevenue = null,Object? availableProducts = null,Object? lowStockAlerts = null,}) {
  return _then(_self.copyWith(
todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,availableProducts: null == availableProducts ? _self.availableProducts : availableProducts // ignore: cast_nullable_to_non_nullable
as int,lowStockAlerts: null == lowStockAlerts ? _self.lowStockAlerts : lowStockAlerts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickStatsModel].
extension QuickStatsModelPatterns on QuickStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _QuickStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuickStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'available_products', fromJson: _intFromJson)  int availableProducts, @JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson)  int lowStockAlerts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickStatsModel() when $default != null:
return $default(_that.todaySales,_that.todayRevenue,_that.availableProducts,_that.lowStockAlerts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'available_products', fromJson: _intFromJson)  int availableProducts, @JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson)  int lowStockAlerts)  $default,) {final _that = this;
switch (_that) {
case _QuickStatsModel():
return $default(_that.todaySales,_that.todayRevenue,_that.availableProducts,_that.lowStockAlerts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'today_sales', fromJson: _intFromJson)  int todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson)  double todayRevenue, @JsonKey(name: 'available_products', fromJson: _intFromJson)  int availableProducts, @JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson)  int lowStockAlerts)?  $default,) {final _that = this;
switch (_that) {
case _QuickStatsModel() when $default != null:
return $default(_that.todaySales,_that.todayRevenue,_that.availableProducts,_that.lowStockAlerts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuickStatsModel implements QuickStatsModel {
  const _QuickStatsModel({@JsonKey(name: 'today_sales', fromJson: _intFromJson) required this.todaySales, @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) required this.todayRevenue, @JsonKey(name: 'available_products', fromJson: _intFromJson) required this.availableProducts, @JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) required this.lowStockAlerts});
  factory _QuickStatsModel.fromJson(Map<String, dynamic> json) => _$QuickStatsModelFromJson(json);

@override@JsonKey(name: 'today_sales', fromJson: _intFromJson) final  int todaySales;
@override@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) final  double todayRevenue;
@override@JsonKey(name: 'available_products', fromJson: _intFromJson) final  int availableProducts;
@override@JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) final  int lowStockAlerts;

/// Create a copy of QuickStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickStatsModelCopyWith<_QuickStatsModel> get copyWith => __$QuickStatsModelCopyWithImpl<_QuickStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickStatsModel&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.availableProducts, availableProducts) || other.availableProducts == availableProducts)&&(identical(other.lowStockAlerts, lowStockAlerts) || other.lowStockAlerts == lowStockAlerts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todaySales,todayRevenue,availableProducts,lowStockAlerts);

@override
String toString() {
  return 'QuickStatsModel(todaySales: $todaySales, todayRevenue: $todayRevenue, availableProducts: $availableProducts, lowStockAlerts: $lowStockAlerts)';
}


}

/// @nodoc
abstract mixin class _$QuickStatsModelCopyWith<$Res> implements $QuickStatsModelCopyWith<$Res> {
  factory _$QuickStatsModelCopyWith(_QuickStatsModel value, $Res Function(_QuickStatsModel) _then) = __$QuickStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'today_sales', fromJson: _intFromJson) int todaySales,@JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) double todayRevenue,@JsonKey(name: 'available_products', fromJson: _intFromJson) int availableProducts,@JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) int lowStockAlerts
});




}
/// @nodoc
class __$QuickStatsModelCopyWithImpl<$Res>
    implements _$QuickStatsModelCopyWith<$Res> {
  __$QuickStatsModelCopyWithImpl(this._self, this._then);

  final _QuickStatsModel _self;
  final $Res Function(_QuickStatsModel) _then;

/// Create a copy of QuickStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todaySales = null,Object? todayRevenue = null,Object? availableProducts = null,Object? lowStockAlerts = null,}) {
  return _then(_QuickStatsModel(
todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as int,todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,availableProducts: null == availableProducts ? _self.availableProducts : availableProducts // ignore: cast_nullable_to_non_nullable
as int,lowStockAlerts: null == lowStockAlerts ? _self.lowStockAlerts : lowStockAlerts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LowStockProductModel {

@JsonKey(name: 'product_id', fromJson: _intFromJson) int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_image') String? get productImage; String? get category;@JsonKey(fromJson: _intFromJson) int get quantity;@JsonKey(fromJson: _doubleFromJson) double get price;@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double get stockValue;
/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockProductModelCopyWith<LowStockProductModel> get copyWith => _$LowStockProductModelCopyWithImpl<LowStockProductModel>(this as LowStockProductModel, _$identity);

  /// Serializes this LowStockProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImage,category,quantity,price,stockValue);

@override
String toString() {
  return 'LowStockProductModel(productId: $productId, productName: $productName, productImage: $productImage, category: $category, quantity: $quantity, price: $price, stockValue: $stockValue)';
}


}

/// @nodoc
abstract mixin class $LowStockProductModelCopyWith<$Res>  {
  factory $LowStockProductModelCopyWith(LowStockProductModel value, $Res Function(LowStockProductModel) _then) = _$LowStockProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_image') String? productImage, String? category,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue
});




}
/// @nodoc
class _$LowStockProductModelCopyWithImpl<$Res>
    implements $LowStockProductModelCopyWith<$Res> {
  _$LowStockProductModelCopyWithImpl(this._self, this._then);

  final LowStockProductModel _self;
  final $Res Function(LowStockProductModel) _then;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? productImage = freezed,Object? category = freezed,Object? quantity = null,Object? price = null,Object? stockValue = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockProductModel].
extension LowStockProductModelPatterns on LowStockProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockProductModel value)  $default,){
final _that = this;
switch (_that) {
case _LowStockProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  String? category, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
return $default(_that.productId,_that.productName,_that.productImage,_that.category,_that.quantity,_that.price,_that.stockValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  String? category, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue)  $default,) {final _that = this;
switch (_that) {
case _LowStockProductModel():
return $default(_that.productId,_that.productName,_that.productImage,_that.category,_that.quantity,_that.price,_that.stockValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  String? category, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(fromJson: _doubleFromJson)  double price, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue)?  $default,) {final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
return $default(_that.productId,_that.productName,_that.productImage,_that.category,_that.quantity,_that.price,_that.stockValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockProductModel implements LowStockProductModel {
  const _LowStockProductModel({@JsonKey(name: 'product_id', fromJson: _intFromJson) required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_image') this.productImage, this.category, @JsonKey(fromJson: _intFromJson) required this.quantity, @JsonKey(fromJson: _doubleFromJson) required this.price, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson) required this.stockValue});
  factory _LowStockProductModel.fromJson(Map<String, dynamic> json) => _$LowStockProductModelFromJson(json);

@override@JsonKey(name: 'product_id', fromJson: _intFromJson) final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override final  String? category;
@override@JsonKey(fromJson: _intFromJson) final  int quantity;
@override@JsonKey(fromJson: _doubleFromJson) final  double price;
@override@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) final  double stockValue;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockProductModelCopyWith<_LowStockProductModel> get copyWith => __$LowStockProductModelCopyWithImpl<_LowStockProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImage,category,quantity,price,stockValue);

@override
String toString() {
  return 'LowStockProductModel(productId: $productId, productName: $productName, productImage: $productImage, category: $category, quantity: $quantity, price: $price, stockValue: $stockValue)';
}


}

/// @nodoc
abstract mixin class _$LowStockProductModelCopyWith<$Res> implements $LowStockProductModelCopyWith<$Res> {
  factory _$LowStockProductModelCopyWith(_LowStockProductModel value, $Res Function(_LowStockProductModel) _then) = __$LowStockProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_image') String? productImage, String? category,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(fromJson: _doubleFromJson) double price,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue
});




}
/// @nodoc
class __$LowStockProductModelCopyWithImpl<$Res>
    implements _$LowStockProductModelCopyWith<$Res> {
  __$LowStockProductModelCopyWithImpl(this._self, this._then);

  final _LowStockProductModel _self;
  final $Res Function(_LowStockProductModel) _then;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? productImage = freezed,Object? category = freezed,Object? quantity = null,Object? price = null,Object? stockValue = null,}) {
  return _then(_LowStockProductModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

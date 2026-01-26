// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

 int get id; String get name; String? get description;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'CategoryModel(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description
});




}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryModel].
extension CategoryModelPatterns on CategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CategoryModel():
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryModel implements CategoryModel {
  const _CategoryModel({required this.id, required this.name, this.description});
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'CategoryModel(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description
});




}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProductModel {

 int get id; String get name;@JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson) String get priceString;@JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) int get categoryId; String? get description; String? get image; CategoryModel? get category;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceString, priceString) || other.priceString == priceString)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,priceString,categoryId,description,image,category);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, priceString: $priceString, categoryId: $categoryId, description: $description, image: $image, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson) String priceString,@JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) int categoryId, String? description, String? image, CategoryModel? category
});


$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? priceString = null,Object? categoryId = null,Object? description = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceString: null == priceString ? _self.priceString : priceString // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson)  String priceString, @JsonKey(name: 'category_id', fromJson: _categoryIdFromJson)  int categoryId,  String? description,  String? image,  CategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.priceString,_that.categoryId,_that.description,_that.image,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson)  String priceString, @JsonKey(name: 'category_id', fromJson: _categoryIdFromJson)  int categoryId,  String? description,  String? image,  CategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.priceString,_that.categoryId,_that.description,_that.image,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson)  String priceString, @JsonKey(name: 'category_id', fromJson: _categoryIdFromJson)  int categoryId,  String? description,  String? image,  CategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.priceString,_that.categoryId,_that.description,_that.image,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ProductModel implements ProductModel {
  const _ProductModel({required this.id, required this.name, @JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson) required this.priceString, @JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) required this.categoryId, this.description, this.image, this.category});
  

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson) final  String priceString;
@override@JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) final  int categoryId;
@override final  String? description;
@override final  String? image;
@override final  CategoryModel? category;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceString, priceString) || other.priceString == priceString)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,priceString,categoryId,description,image,category);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, priceString: $priceString, categoryId: $categoryId, description: $description, image: $image, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'price', fromJson: _priceFromJson, toJson: _priceToJson) String priceString,@JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) int categoryId, String? description, String? image, CategoryModel? category
});


@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? priceString = null,Object? categoryId = null,Object? description = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceString: null == priceString ? _self.priceString : priceString // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$StockItemResponseModel {

@JsonKey(fromJson: _intFromJson) int get id;@JsonKey(name: 'product_id', fromJson: _intFromJson) int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_description') String? get productDescription;@JsonKey(name: 'product_image') String? get productImage; Map<String, dynamic>? get category;@JsonKey(fromJson: _priceFromJson) String get price;@JsonKey(fromJson: _intFromJson) int get quantity;@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double get stockValue;@JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) bool get isLowStock;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of StockItemResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockItemResponseModelCopyWith<StockItemResponseModel> get copyWith => _$StockItemResponseModelCopyWithImpl<StockItemResponseModel>(this as StockItemResponseModel, _$identity);

  /// Serializes this StockItemResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockItemResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&const DeepCollectionEquality().equals(other.category, category)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.isLowStock, isLowStock) || other.isLowStock == isLowStock)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productDescription,productImage,const DeepCollectionEquality().hash(category),price,quantity,stockValue,isLowStock,updatedAt);

@override
String toString() {
  return 'StockItemResponseModel(id: $id, productId: $productId, productName: $productName, productDescription: $productDescription, productImage: $productImage, category: $category, price: $price, quantity: $quantity, stockValue: $stockValue, isLowStock: $isLowStock, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StockItemResponseModelCopyWith<$Res>  {
  factory $StockItemResponseModelCopyWith(StockItemResponseModel value, $Res Function(StockItemResponseModel) _then) = _$StockItemResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_description') String? productDescription,@JsonKey(name: 'product_image') String? productImage, Map<String, dynamic>? category,@JsonKey(fromJson: _priceFromJson) String price,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue,@JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) bool isLowStock,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$StockItemResponseModelCopyWithImpl<$Res>
    implements $StockItemResponseModelCopyWith<$Res> {
  _$StockItemResponseModelCopyWithImpl(this._self, this._then);

  final StockItemResponseModel _self;
  final $Res Function(StockItemResponseModel) _then;

/// Create a copy of StockItemResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productDescription = freezed,Object? productImage = freezed,Object? category = freezed,Object? price = null,Object? quantity = null,Object? stockValue = null,Object? isLowStock = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,isLowStock: null == isLowStock ? _self.isLowStock : isLowStock // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockItemResponseModel].
extension StockItemResponseModelPatterns on StockItemResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockItemResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockItemResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockItemResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StockItemResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockItemResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockItemResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_description')  String? productDescription, @JsonKey(name: 'product_image')  String? productImage,  Map<String, dynamic>? category, @JsonKey(fromJson: _priceFromJson)  String price, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock', fromJson: _boolFromJson)  bool isLowStock, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockItemResponseModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productDescription,_that.productImage,_that.category,_that.price,_that.quantity,_that.stockValue,_that.isLowStock,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_description')  String? productDescription, @JsonKey(name: 'product_image')  String? productImage,  Map<String, dynamic>? category, @JsonKey(fromJson: _priceFromJson)  String price, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock', fromJson: _boolFromJson)  bool isLowStock, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _StockItemResponseModel():
return $default(_that.id,_that.productId,_that.productName,_that.productDescription,_that.productImage,_that.category,_that.price,_that.quantity,_that.stockValue,_that.isLowStock,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'product_id', fromJson: _intFromJson)  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_description')  String? productDescription, @JsonKey(name: 'product_image')  String? productImage,  Map<String, dynamic>? category, @JsonKey(fromJson: _priceFromJson)  String price, @JsonKey(fromJson: _intFromJson)  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock', fromJson: _boolFromJson)  bool isLowStock, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockItemResponseModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productDescription,_that.productImage,_that.category,_that.price,_that.quantity,_that.stockValue,_that.isLowStock,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockItemResponseModel implements StockItemResponseModel {
  const _StockItemResponseModel({@JsonKey(fromJson: _intFromJson) required this.id, @JsonKey(name: 'product_id', fromJson: _intFromJson) required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_description') this.productDescription, @JsonKey(name: 'product_image') this.productImage, final  Map<String, dynamic>? category, @JsonKey(fromJson: _priceFromJson) required this.price, @JsonKey(fromJson: _intFromJson) required this.quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson) required this.stockValue, @JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) required this.isLowStock, @JsonKey(name: 'updated_at') this.updatedAt}): _category = category;
  factory _StockItemResponseModel.fromJson(Map<String, dynamic> json) => _$StockItemResponseModelFromJson(json);

@override@JsonKey(fromJson: _intFromJson) final  int id;
@override@JsonKey(name: 'product_id', fromJson: _intFromJson) final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_description') final  String? productDescription;
@override@JsonKey(name: 'product_image') final  String? productImage;
 final  Map<String, dynamic>? _category;
@override Map<String, dynamic>? get category {
  final value = _category;
  if (value == null) return null;
  if (_category is EqualUnmodifiableMapView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(fromJson: _priceFromJson) final  String price;
@override@JsonKey(fromJson: _intFromJson) final  int quantity;
@override@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) final  double stockValue;
@override@JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) final  bool isLowStock;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of StockItemResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockItemResponseModelCopyWith<_StockItemResponseModel> get copyWith => __$StockItemResponseModelCopyWithImpl<_StockItemResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockItemResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockItemResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&const DeepCollectionEquality().equals(other._category, _category)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.isLowStock, isLowStock) || other.isLowStock == isLowStock)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productDescription,productImage,const DeepCollectionEquality().hash(_category),price,quantity,stockValue,isLowStock,updatedAt);

@override
String toString() {
  return 'StockItemResponseModel(id: $id, productId: $productId, productName: $productName, productDescription: $productDescription, productImage: $productImage, category: $category, price: $price, quantity: $quantity, stockValue: $stockValue, isLowStock: $isLowStock, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StockItemResponseModelCopyWith<$Res> implements $StockItemResponseModelCopyWith<$Res> {
  factory _$StockItemResponseModelCopyWith(_StockItemResponseModel value, $Res Function(_StockItemResponseModel) _then) = __$StockItemResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'product_id', fromJson: _intFromJson) int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_description') String? productDescription,@JsonKey(name: 'product_image') String? productImage, Map<String, dynamic>? category,@JsonKey(fromJson: _priceFromJson) String price,@JsonKey(fromJson: _intFromJson) int quantity,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue,@JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) bool isLowStock,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$StockItemResponseModelCopyWithImpl<$Res>
    implements _$StockItemResponseModelCopyWith<$Res> {
  __$StockItemResponseModelCopyWithImpl(this._self, this._then);

  final _StockItemResponseModel _self;
  final $Res Function(_StockItemResponseModel) _then;

/// Create a copy of StockItemResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productDescription = freezed,Object? productImage = freezed,Object? category = freezed,Object? price = null,Object? quantity = null,Object? stockValue = null,Object? isLowStock = null,Object? updatedAt = freezed,}) {
  return _then(_StockItemResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,isLowStock: null == isLowStock ? _self.isLowStock : isLowStock // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StockItemModel {

 int get id;@JsonKey(name: 'driver_id') int get driverId;@JsonKey(name: 'product_id') int get productId; int get quantity;@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel get product;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockItemModelCopyWith<StockItemModel> get copyWith => _$StockItemModelCopyWithImpl<StockItemModel>(this as StockItemModel, _$identity);

  /// Serializes this StockItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.product, product) || other.product == product)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,driverId,productId,quantity,product,updatedAt);

@override
String toString() {
  return 'StockItemModel(id: $id, driverId: $driverId, productId: $productId, quantity: $quantity, product: $product, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StockItemModelCopyWith<$Res>  {
  factory $StockItemModelCopyWith(StockItemModel value, $Res Function(StockItemModel) _then) = _$StockItemModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'driver_id') int driverId,@JsonKey(name: 'product_id') int productId, int quantity,@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel product,@JsonKey(name: 'updated_at') String? updatedAt
});


$ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$StockItemModelCopyWithImpl<$Res>
    implements $StockItemModelCopyWith<$Res> {
  _$StockItemModelCopyWithImpl(this._self, this._then);

  final StockItemModel _self;
  final $Res Function(StockItemModel) _then;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? driverId = null,Object? productId = null,Object? quantity = null,Object? product = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockItemModel].
extension StockItemModelPatterns on StockItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockItemModel value)  $default,){
final _that = this;
switch (_that) {
case _StockItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'driver_id')  int driverId, @JsonKey(name: 'product_id')  int productId,  int quantity, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
return $default(_that.id,_that.driverId,_that.productId,_that.quantity,_that.product,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'driver_id')  int driverId, @JsonKey(name: 'product_id')  int productId,  int quantity, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _StockItemModel():
return $default(_that.id,_that.driverId,_that.productId,_that.quantity,_that.product,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'driver_id')  int driverId, @JsonKey(name: 'product_id')  int productId,  int quantity, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
return $default(_that.id,_that.driverId,_that.productId,_that.quantity,_that.product,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockItemModel implements StockItemModel {
  const _StockItemModel({required this.id, @JsonKey(name: 'driver_id') required this.driverId, @JsonKey(name: 'product_id') required this.productId, required this.quantity, @JsonKey(toJson: _productToJson, fromJson: _productFromJson) required this.product, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _StockItemModel.fromJson(Map<String, dynamic> json) => _$StockItemModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'driver_id') final  int driverId;
@override@JsonKey(name: 'product_id') final  int productId;
@override final  int quantity;
@override@JsonKey(toJson: _productToJson, fromJson: _productFromJson) final  ProductModel product;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockItemModelCopyWith<_StockItemModel> get copyWith => __$StockItemModelCopyWithImpl<_StockItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.product, product) || other.product == product)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,driverId,productId,quantity,product,updatedAt);

@override
String toString() {
  return 'StockItemModel(id: $id, driverId: $driverId, productId: $productId, quantity: $quantity, product: $product, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StockItemModelCopyWith<$Res> implements $StockItemModelCopyWith<$Res> {
  factory _$StockItemModelCopyWith(_StockItemModel value, $Res Function(_StockItemModel) _then) = __$StockItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'driver_id') int driverId,@JsonKey(name: 'product_id') int productId, int quantity,@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel product,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$StockItemModelCopyWithImpl<$Res>
    implements _$StockItemModelCopyWith<$Res> {
  __$StockItemModelCopyWithImpl(this._self, this._then);

  final _StockItemModel _self;
  final $Res Function(_StockItemModel) _then;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? driverId = null,Object? productId = null,Object? quantity = null,Object? product = null,Object? updatedAt = freezed,}) {
  return _then(_StockItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$StockDetailModel {

 int get id;@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel get product; int get quantity;@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double get stockValue;@JsonKey(name: 'is_low_stock') bool get isLowStock;@JsonKey(name: 'last_updated') String? get lastUpdated;@JsonKey(name: 'assignment_history') List<AssignmentHistoryModel>? get assignmentHistory;
/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDetailModelCopyWith<StockDetailModel> get copyWith => _$StockDetailModelCopyWithImpl<StockDetailModel>(this as StockDetailModel, _$identity);

  /// Serializes this StockDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.isLowStock, isLowStock) || other.isLowStock == isLowStock)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.assignmentHistory, assignmentHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,stockValue,isLowStock,lastUpdated,const DeepCollectionEquality().hash(assignmentHistory));

@override
String toString() {
  return 'StockDetailModel(id: $id, product: $product, quantity: $quantity, stockValue: $stockValue, isLowStock: $isLowStock, lastUpdated: $lastUpdated, assignmentHistory: $assignmentHistory)';
}


}

/// @nodoc
abstract mixin class $StockDetailModelCopyWith<$Res>  {
  factory $StockDetailModelCopyWith(StockDetailModel value, $Res Function(StockDetailModel) _then) = _$StockDetailModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel product, int quantity,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue,@JsonKey(name: 'is_low_stock') bool isLowStock,@JsonKey(name: 'last_updated') String? lastUpdated,@JsonKey(name: 'assignment_history') List<AssignmentHistoryModel>? assignmentHistory
});


$ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$StockDetailModelCopyWithImpl<$Res>
    implements $StockDetailModelCopyWith<$Res> {
  _$StockDetailModelCopyWithImpl(this._self, this._then);

  final StockDetailModel _self;
  final $Res Function(StockDetailModel) _then;

/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? quantity = null,Object? stockValue = null,Object? isLowStock = null,Object? lastUpdated = freezed,Object? assignmentHistory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,isLowStock: null == isLowStock ? _self.isLowStock : isLowStock // ignore: cast_nullable_to_non_nullable
as bool,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,assignmentHistory: freezed == assignmentHistory ? _self.assignmentHistory : assignmentHistory // ignore: cast_nullable_to_non_nullable
as List<AssignmentHistoryModel>?,
  ));
}
/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockDetailModel].
extension StockDetailModelPatterns on StockDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _StockDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product,  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock')  bool isLowStock, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'assignment_history')  List<AssignmentHistoryModel>? assignmentHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockDetailModel() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.stockValue,_that.isLowStock,_that.lastUpdated,_that.assignmentHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product,  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock')  bool isLowStock, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'assignment_history')  List<AssignmentHistoryModel>? assignmentHistory)  $default,) {final _that = this;
switch (_that) {
case _StockDetailModel():
return $default(_that.id,_that.product,_that.quantity,_that.stockValue,_that.isLowStock,_that.lastUpdated,_that.assignmentHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(toJson: _productToJson, fromJson: _productFromJson)  ProductModel product,  int quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)  double stockValue, @JsonKey(name: 'is_low_stock')  bool isLowStock, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'assignment_history')  List<AssignmentHistoryModel>? assignmentHistory)?  $default,) {final _that = this;
switch (_that) {
case _StockDetailModel() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.stockValue,_that.isLowStock,_that.lastUpdated,_that.assignmentHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockDetailModel implements StockDetailModel {
  const _StockDetailModel({required this.id, @JsonKey(toJson: _productToJson, fromJson: _productFromJson) required this.product, required this.quantity, @JsonKey(name: 'stock_value', fromJson: _doubleFromJson) required this.stockValue, @JsonKey(name: 'is_low_stock') required this.isLowStock, @JsonKey(name: 'last_updated') this.lastUpdated, @JsonKey(name: 'assignment_history') final  List<AssignmentHistoryModel>? assignmentHistory}): _assignmentHistory = assignmentHistory;
  factory _StockDetailModel.fromJson(Map<String, dynamic> json) => _$StockDetailModelFromJson(json);

@override final  int id;
@override@JsonKey(toJson: _productToJson, fromJson: _productFromJson) final  ProductModel product;
@override final  int quantity;
@override@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) final  double stockValue;
@override@JsonKey(name: 'is_low_stock') final  bool isLowStock;
@override@JsonKey(name: 'last_updated') final  String? lastUpdated;
 final  List<AssignmentHistoryModel>? _assignmentHistory;
@override@JsonKey(name: 'assignment_history') List<AssignmentHistoryModel>? get assignmentHistory {
  final value = _assignmentHistory;
  if (value == null) return null;
  if (_assignmentHistory is EqualUnmodifiableListView) return _assignmentHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDetailModelCopyWith<_StockDetailModel> get copyWith => __$StockDetailModelCopyWithImpl<_StockDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.isLowStock, isLowStock) || other.isLowStock == isLowStock)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._assignmentHistory, _assignmentHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,stockValue,isLowStock,lastUpdated,const DeepCollectionEquality().hash(_assignmentHistory));

@override
String toString() {
  return 'StockDetailModel(id: $id, product: $product, quantity: $quantity, stockValue: $stockValue, isLowStock: $isLowStock, lastUpdated: $lastUpdated, assignmentHistory: $assignmentHistory)';
}


}

/// @nodoc
abstract mixin class _$StockDetailModelCopyWith<$Res> implements $StockDetailModelCopyWith<$Res> {
  factory _$StockDetailModelCopyWith(_StockDetailModel value, $Res Function(_StockDetailModel) _then) = __$StockDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(toJson: _productToJson, fromJson: _productFromJson) ProductModel product, int quantity,@JsonKey(name: 'stock_value', fromJson: _doubleFromJson) double stockValue,@JsonKey(name: 'is_low_stock') bool isLowStock,@JsonKey(name: 'last_updated') String? lastUpdated,@JsonKey(name: 'assignment_history') List<AssignmentHistoryModel>? assignmentHistory
});


@override $ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$StockDetailModelCopyWithImpl<$Res>
    implements _$StockDetailModelCopyWith<$Res> {
  __$StockDetailModelCopyWithImpl(this._self, this._then);

  final _StockDetailModel _self;
  final $Res Function(_StockDetailModel) _then;

/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? quantity = null,Object? stockValue = null,Object? isLowStock = null,Object? lastUpdated = freezed,Object? assignmentHistory = freezed,}) {
  return _then(_StockDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,isLowStock: null == isLowStock ? _self.isLowStock : isLowStock // ignore: cast_nullable_to_non_nullable
as bool,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,assignmentHistory: freezed == assignmentHistory ? _self._assignmentHistory : assignmentHistory // ignore: cast_nullable_to_non_nullable
as List<AssignmentHistoryModel>?,
  ));
}

/// Create a copy of StockDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$AssignmentHistoryModel {

 int get id; int get quantity;@JsonKey(name: 'price_at_assignment') double? get priceAtAssignment;@JsonKey(name: 'assigned_from') String get assignedFrom;@JsonKey(name: 'assigned_at') String get assignedAt;
/// Create a copy of AssignmentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentHistoryModelCopyWith<AssignmentHistoryModel> get copyWith => _$AssignmentHistoryModelCopyWithImpl<AssignmentHistoryModel>(this as AssignmentHistoryModel, _$identity);

  /// Serializes this AssignmentHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtAssignment, priceAtAssignment) || other.priceAtAssignment == priceAtAssignment)&&(identical(other.assignedFrom, assignedFrom) || other.assignedFrom == assignedFrom)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,priceAtAssignment,assignedFrom,assignedAt);

@override
String toString() {
  return 'AssignmentHistoryModel(id: $id, quantity: $quantity, priceAtAssignment: $priceAtAssignment, assignedFrom: $assignedFrom, assignedAt: $assignedAt)';
}


}

/// @nodoc
abstract mixin class $AssignmentHistoryModelCopyWith<$Res>  {
  factory $AssignmentHistoryModelCopyWith(AssignmentHistoryModel value, $Res Function(AssignmentHistoryModel) _then) = _$AssignmentHistoryModelCopyWithImpl;
@useResult
$Res call({
 int id, int quantity,@JsonKey(name: 'price_at_assignment') double? priceAtAssignment,@JsonKey(name: 'assigned_from') String assignedFrom,@JsonKey(name: 'assigned_at') String assignedAt
});




}
/// @nodoc
class _$AssignmentHistoryModelCopyWithImpl<$Res>
    implements $AssignmentHistoryModelCopyWith<$Res> {
  _$AssignmentHistoryModelCopyWithImpl(this._self, this._then);

  final AssignmentHistoryModel _self;
  final $Res Function(AssignmentHistoryModel) _then;

/// Create a copy of AssignmentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,Object? priceAtAssignment = freezed,Object? assignedFrom = null,Object? assignedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceAtAssignment: freezed == priceAtAssignment ? _self.priceAtAssignment : priceAtAssignment // ignore: cast_nullable_to_non_nullable
as double?,assignedFrom: null == assignedFrom ? _self.assignedFrom : assignedFrom // ignore: cast_nullable_to_non_nullable
as String,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentHistoryModel].
extension AssignmentHistoryModelPatterns on AssignmentHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int quantity, @JsonKey(name: 'price_at_assignment')  double? priceAtAssignment, @JsonKey(name: 'assigned_from')  String assignedFrom, @JsonKey(name: 'assigned_at')  String assignedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentHistoryModel() when $default != null:
return $default(_that.id,_that.quantity,_that.priceAtAssignment,_that.assignedFrom,_that.assignedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int quantity, @JsonKey(name: 'price_at_assignment')  double? priceAtAssignment, @JsonKey(name: 'assigned_from')  String assignedFrom, @JsonKey(name: 'assigned_at')  String assignedAt)  $default,) {final _that = this;
switch (_that) {
case _AssignmentHistoryModel():
return $default(_that.id,_that.quantity,_that.priceAtAssignment,_that.assignedFrom,_that.assignedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int quantity, @JsonKey(name: 'price_at_assignment')  double? priceAtAssignment, @JsonKey(name: 'assigned_from')  String assignedFrom, @JsonKey(name: 'assigned_at')  String assignedAt)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentHistoryModel() when $default != null:
return $default(_that.id,_that.quantity,_that.priceAtAssignment,_that.assignedFrom,_that.assignedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentHistoryModel implements AssignmentHistoryModel {
  const _AssignmentHistoryModel({required this.id, required this.quantity, @JsonKey(name: 'price_at_assignment') this.priceAtAssignment, @JsonKey(name: 'assigned_from') required this.assignedFrom, @JsonKey(name: 'assigned_at') required this.assignedAt});
  factory _AssignmentHistoryModel.fromJson(Map<String, dynamic> json) => _$AssignmentHistoryModelFromJson(json);

@override final  int id;
@override final  int quantity;
@override@JsonKey(name: 'price_at_assignment') final  double? priceAtAssignment;
@override@JsonKey(name: 'assigned_from') final  String assignedFrom;
@override@JsonKey(name: 'assigned_at') final  String assignedAt;

/// Create a copy of AssignmentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentHistoryModelCopyWith<_AssignmentHistoryModel> get copyWith => __$AssignmentHistoryModelCopyWithImpl<_AssignmentHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtAssignment, priceAtAssignment) || other.priceAtAssignment == priceAtAssignment)&&(identical(other.assignedFrom, assignedFrom) || other.assignedFrom == assignedFrom)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,priceAtAssignment,assignedFrom,assignedAt);

@override
String toString() {
  return 'AssignmentHistoryModel(id: $id, quantity: $quantity, priceAtAssignment: $priceAtAssignment, assignedFrom: $assignedFrom, assignedAt: $assignedAt)';
}


}

/// @nodoc
abstract mixin class _$AssignmentHistoryModelCopyWith<$Res> implements $AssignmentHistoryModelCopyWith<$Res> {
  factory _$AssignmentHistoryModelCopyWith(_AssignmentHistoryModel value, $Res Function(_AssignmentHistoryModel) _then) = __$AssignmentHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int quantity,@JsonKey(name: 'price_at_assignment') double? priceAtAssignment,@JsonKey(name: 'assigned_from') String assignedFrom,@JsonKey(name: 'assigned_at') String assignedAt
});




}
/// @nodoc
class __$AssignmentHistoryModelCopyWithImpl<$Res>
    implements _$AssignmentHistoryModelCopyWith<$Res> {
  __$AssignmentHistoryModelCopyWithImpl(this._self, this._then);

  final _AssignmentHistoryModel _self;
  final $Res Function(_AssignmentHistoryModel) _then;

/// Create a copy of AssignmentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? quantity = null,Object? priceAtAssignment = freezed,Object? assignedFrom = null,Object? assignedAt = null,}) {
  return _then(_AssignmentHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceAtAssignment: freezed == priceAtAssignment ? _self.priceAtAssignment : priceAtAssignment // ignore: cast_nullable_to_non_nullable
as double?,assignedFrom: null == assignedFrom ? _self.assignedFrom : assignedFrom // ignore: cast_nullable_to_non_nullable
as String,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StockStatisticsModel {

@JsonKey(name: 'total_products') int get totalProducts;@JsonKey(name: 'total_quantity') int get totalQuantity;@JsonKey(name: 'stock_value') double get stockValue;@JsonKey(name: 'low_stock_threshold') int get lowStockThreshold;@JsonKey(name: 'low_stock_count') int get lowStockCount;@JsonKey(name: 'low_stock_items') List<LowStockItemModel> get lowStockItems;@JsonKey(name: 'category_breakdown') List<CategoryBreakdownModel> get categoryBreakdown;
/// Create a copy of StockStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockStatisticsModelCopyWith<StockStatisticsModel> get copyWith => _$StockStatisticsModelCopyWithImpl<StockStatisticsModel>(this as StockStatisticsModel, _$identity);

  /// Serializes this StockStatisticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockStatisticsModel&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.lowStockThreshold, lowStockThreshold) || other.lowStockThreshold == lowStockThreshold)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&const DeepCollectionEquality().equals(other.lowStockItems, lowStockItems)&&const DeepCollectionEquality().equals(other.categoryBreakdown, categoryBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,totalQuantity,stockValue,lowStockThreshold,lowStockCount,const DeepCollectionEquality().hash(lowStockItems),const DeepCollectionEquality().hash(categoryBreakdown));

@override
String toString() {
  return 'StockStatisticsModel(totalProducts: $totalProducts, totalQuantity: $totalQuantity, stockValue: $stockValue, lowStockThreshold: $lowStockThreshold, lowStockCount: $lowStockCount, lowStockItems: $lowStockItems, categoryBreakdown: $categoryBreakdown)';
}


}

/// @nodoc
abstract mixin class $StockStatisticsModelCopyWith<$Res>  {
  factory $StockStatisticsModelCopyWith(StockStatisticsModel value, $Res Function(StockStatisticsModel) _then) = _$StockStatisticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_products') int totalProducts,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'stock_value') double stockValue,@JsonKey(name: 'low_stock_threshold') int lowStockThreshold,@JsonKey(name: 'low_stock_count') int lowStockCount,@JsonKey(name: 'low_stock_items') List<LowStockItemModel> lowStockItems,@JsonKey(name: 'category_breakdown') List<CategoryBreakdownModel> categoryBreakdown
});




}
/// @nodoc
class _$StockStatisticsModelCopyWithImpl<$Res>
    implements $StockStatisticsModelCopyWith<$Res> {
  _$StockStatisticsModelCopyWithImpl(this._self, this._then);

  final StockStatisticsModel _self;
  final $Res Function(StockStatisticsModel) _then;

/// Create a copy of StockStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalProducts = null,Object? totalQuantity = null,Object? stockValue = null,Object? lowStockThreshold = null,Object? lowStockCount = null,Object? lowStockItems = null,Object? categoryBreakdown = null,}) {
  return _then(_self.copyWith(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,lowStockThreshold: null == lowStockThreshold ? _self.lowStockThreshold : lowStockThreshold // ignore: cast_nullable_to_non_nullable
as int,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,lowStockItems: null == lowStockItems ? _self.lowStockItems : lowStockItems // ignore: cast_nullable_to_non_nullable
as List<LowStockItemModel>,categoryBreakdown: null == categoryBreakdown ? _self.categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategoryBreakdownModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [StockStatisticsModel].
extension StockStatisticsModelPatterns on StockStatisticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockStatisticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockStatisticsModel value)  $default,){
final _that = this;
switch (_that) {
case _StockStatisticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockStatisticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'stock_value')  double stockValue, @JsonKey(name: 'low_stock_threshold')  int lowStockThreshold, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'low_stock_items')  List<LowStockItemModel> lowStockItems, @JsonKey(name: 'category_breakdown')  List<CategoryBreakdownModel> categoryBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockStatisticsModel() when $default != null:
return $default(_that.totalProducts,_that.totalQuantity,_that.stockValue,_that.lowStockThreshold,_that.lowStockCount,_that.lowStockItems,_that.categoryBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'stock_value')  double stockValue, @JsonKey(name: 'low_stock_threshold')  int lowStockThreshold, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'low_stock_items')  List<LowStockItemModel> lowStockItems, @JsonKey(name: 'category_breakdown')  List<CategoryBreakdownModel> categoryBreakdown)  $default,) {final _that = this;
switch (_that) {
case _StockStatisticsModel():
return $default(_that.totalProducts,_that.totalQuantity,_that.stockValue,_that.lowStockThreshold,_that.lowStockCount,_that.lowStockItems,_that.categoryBreakdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'stock_value')  double stockValue, @JsonKey(name: 'low_stock_threshold')  int lowStockThreshold, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'low_stock_items')  List<LowStockItemModel> lowStockItems, @JsonKey(name: 'category_breakdown')  List<CategoryBreakdownModel> categoryBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _StockStatisticsModel() when $default != null:
return $default(_that.totalProducts,_that.totalQuantity,_that.stockValue,_that.lowStockThreshold,_that.lowStockCount,_that.lowStockItems,_that.categoryBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockStatisticsModel implements StockStatisticsModel {
  const _StockStatisticsModel({@JsonKey(name: 'total_products') required this.totalProducts, @JsonKey(name: 'total_quantity') required this.totalQuantity, @JsonKey(name: 'stock_value') required this.stockValue, @JsonKey(name: 'low_stock_threshold') required this.lowStockThreshold, @JsonKey(name: 'low_stock_count') required this.lowStockCount, @JsonKey(name: 'low_stock_items') required final  List<LowStockItemModel> lowStockItems, @JsonKey(name: 'category_breakdown') required final  List<CategoryBreakdownModel> categoryBreakdown}): _lowStockItems = lowStockItems,_categoryBreakdown = categoryBreakdown;
  factory _StockStatisticsModel.fromJson(Map<String, dynamic> json) => _$StockStatisticsModelFromJson(json);

@override@JsonKey(name: 'total_products') final  int totalProducts;
@override@JsonKey(name: 'total_quantity') final  int totalQuantity;
@override@JsonKey(name: 'stock_value') final  double stockValue;
@override@JsonKey(name: 'low_stock_threshold') final  int lowStockThreshold;
@override@JsonKey(name: 'low_stock_count') final  int lowStockCount;
 final  List<LowStockItemModel> _lowStockItems;
@override@JsonKey(name: 'low_stock_items') List<LowStockItemModel> get lowStockItems {
  if (_lowStockItems is EqualUnmodifiableListView) return _lowStockItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStockItems);
}

 final  List<CategoryBreakdownModel> _categoryBreakdown;
@override@JsonKey(name: 'category_breakdown') List<CategoryBreakdownModel> get categoryBreakdown {
  if (_categoryBreakdown is EqualUnmodifiableListView) return _categoryBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryBreakdown);
}


/// Create a copy of StockStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockStatisticsModelCopyWith<_StockStatisticsModel> get copyWith => __$StockStatisticsModelCopyWithImpl<_StockStatisticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockStatisticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockStatisticsModel&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.stockValue, stockValue) || other.stockValue == stockValue)&&(identical(other.lowStockThreshold, lowStockThreshold) || other.lowStockThreshold == lowStockThreshold)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&const DeepCollectionEquality().equals(other._lowStockItems, _lowStockItems)&&const DeepCollectionEquality().equals(other._categoryBreakdown, _categoryBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,totalQuantity,stockValue,lowStockThreshold,lowStockCount,const DeepCollectionEquality().hash(_lowStockItems),const DeepCollectionEquality().hash(_categoryBreakdown));

@override
String toString() {
  return 'StockStatisticsModel(totalProducts: $totalProducts, totalQuantity: $totalQuantity, stockValue: $stockValue, lowStockThreshold: $lowStockThreshold, lowStockCount: $lowStockCount, lowStockItems: $lowStockItems, categoryBreakdown: $categoryBreakdown)';
}


}

/// @nodoc
abstract mixin class _$StockStatisticsModelCopyWith<$Res> implements $StockStatisticsModelCopyWith<$Res> {
  factory _$StockStatisticsModelCopyWith(_StockStatisticsModel value, $Res Function(_StockStatisticsModel) _then) = __$StockStatisticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_products') int totalProducts,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'stock_value') double stockValue,@JsonKey(name: 'low_stock_threshold') int lowStockThreshold,@JsonKey(name: 'low_stock_count') int lowStockCount,@JsonKey(name: 'low_stock_items') List<LowStockItemModel> lowStockItems,@JsonKey(name: 'category_breakdown') List<CategoryBreakdownModel> categoryBreakdown
});




}
/// @nodoc
class __$StockStatisticsModelCopyWithImpl<$Res>
    implements _$StockStatisticsModelCopyWith<$Res> {
  __$StockStatisticsModelCopyWithImpl(this._self, this._then);

  final _StockStatisticsModel _self;
  final $Res Function(_StockStatisticsModel) _then;

/// Create a copy of StockStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalProducts = null,Object? totalQuantity = null,Object? stockValue = null,Object? lowStockThreshold = null,Object? lowStockCount = null,Object? lowStockItems = null,Object? categoryBreakdown = null,}) {
  return _then(_StockStatisticsModel(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,stockValue: null == stockValue ? _self.stockValue : stockValue // ignore: cast_nullable_to_non_nullable
as double,lowStockThreshold: null == lowStockThreshold ? _self.lowStockThreshold : lowStockThreshold // ignore: cast_nullable_to_non_nullable
as int,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,lowStockItems: null == lowStockItems ? _self._lowStockItems : lowStockItems // ignore: cast_nullable_to_non_nullable
as List<LowStockItemModel>,categoryBreakdown: null == categoryBreakdown ? _self._categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategoryBreakdownModel>,
  ));
}


}


/// @nodoc
mixin _$LowStockItemModel {

@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name') String get productName; int get quantity;
/// Create a copy of LowStockItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockItemModelCopyWith<LowStockItemModel> get copyWith => _$LowStockItemModelCopyWithImpl<LowStockItemModel>(this as LowStockItemModel, _$identity);

  /// Serializes this LowStockItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockItemModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantity);

@override
String toString() {
  return 'LowStockItemModel(productId: $productId, productName: $productName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $LowStockItemModelCopyWith<$Res>  {
  factory $LowStockItemModelCopyWith(LowStockItemModel value, $Res Function(LowStockItemModel) _then) = _$LowStockItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName, int quantity
});




}
/// @nodoc
class _$LowStockItemModelCopyWithImpl<$Res>
    implements $LowStockItemModelCopyWith<$Res> {
  _$LowStockItemModelCopyWithImpl(this._self, this._then);

  final LowStockItemModel _self;
  final $Res Function(LowStockItemModel) _then;

/// Create a copy of LowStockItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockItemModel].
extension LowStockItemModelPatterns on LowStockItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockItemModel value)  $default,){
final _that = this;
switch (_that) {
case _LowStockItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockItemModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _LowStockItemModel():
return $default(_that.productId,_that.productName,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _LowStockItemModel() when $default != null:
return $default(_that.productId,_that.productName,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockItemModel implements LowStockItemModel {
  const _LowStockItemModel({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, required this.quantity});
  factory _LowStockItemModel.fromJson(Map<String, dynamic> json) => _$LowStockItemModelFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override final  int quantity;

/// Create a copy of LowStockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockItemModelCopyWith<_LowStockItemModel> get copyWith => __$LowStockItemModelCopyWithImpl<_LowStockItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockItemModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,quantity);

@override
String toString() {
  return 'LowStockItemModel(productId: $productId, productName: $productName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$LowStockItemModelCopyWith<$Res> implements $LowStockItemModelCopyWith<$Res> {
  factory _$LowStockItemModelCopyWith(_LowStockItemModel value, $Res Function(_LowStockItemModel) _then) = __$LowStockItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName, int quantity
});




}
/// @nodoc
class __$LowStockItemModelCopyWithImpl<$Res>
    implements _$LowStockItemModelCopyWith<$Res> {
  __$LowStockItemModelCopyWithImpl(this._self, this._then);

  final _LowStockItemModel _self;
  final $Res Function(_LowStockItemModel) _then;

/// Create a copy of LowStockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? quantity = null,}) {
  return _then(_LowStockItemModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CategoryBreakdownModel {

@JsonKey(name: 'category_id') int? get categoryId;@JsonKey(name: 'category_name') String get categoryName;@JsonKey(name: 'product_count') int get productCount;@JsonKey(name: 'total_quantity') int get totalQuantity;@JsonKey(name: 'category_value') double get categoryValue;
/// Create a copy of CategoryBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryBreakdownModelCopyWith<CategoryBreakdownModel> get copyWith => _$CategoryBreakdownModelCopyWithImpl<CategoryBreakdownModel>(this as CategoryBreakdownModel, _$identity);

  /// Serializes this CategoryBreakdownModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryBreakdownModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.categoryValue, categoryValue) || other.categoryValue == categoryValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,productCount,totalQuantity,categoryValue);

@override
String toString() {
  return 'CategoryBreakdownModel(categoryId: $categoryId, categoryName: $categoryName, productCount: $productCount, totalQuantity: $totalQuantity, categoryValue: $categoryValue)';
}


}

/// @nodoc
abstract mixin class $CategoryBreakdownModelCopyWith<$Res>  {
  factory $CategoryBreakdownModelCopyWith(CategoryBreakdownModel value, $Res Function(CategoryBreakdownModel) _then) = _$CategoryBreakdownModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'product_count') int productCount,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'category_value') double categoryValue
});




}
/// @nodoc
class _$CategoryBreakdownModelCopyWithImpl<$Res>
    implements $CategoryBreakdownModelCopyWith<$Res> {
  _$CategoryBreakdownModelCopyWithImpl(this._self, this._then);

  final CategoryBreakdownModel _self;
  final $Res Function(CategoryBreakdownModel) _then;

/// Create a copy of CategoryBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = freezed,Object? categoryName = null,Object? productCount = null,Object? totalQuantity = null,Object? categoryValue = null,}) {
  return _then(_self.copyWith(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryValue: null == categoryValue ? _self.categoryValue : categoryValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryBreakdownModel].
extension CategoryBreakdownModelPatterns on CategoryBreakdownModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryBreakdownModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryBreakdownModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdownModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryBreakdownModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'category_value')  double categoryValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryBreakdownModel() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.productCount,_that.totalQuantity,_that.categoryValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'category_value')  double categoryValue)  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdownModel():
return $default(_that.categoryId,_that.categoryName,_that.productCount,_that.totalQuantity,_that.categoryValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'category_value')  double categoryValue)?  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdownModel() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.productCount,_that.totalQuantity,_that.categoryValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryBreakdownModel implements CategoryBreakdownModel {
  const _CategoryBreakdownModel({@JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'category_name') required this.categoryName, @JsonKey(name: 'product_count') required this.productCount, @JsonKey(name: 'total_quantity') required this.totalQuantity, @JsonKey(name: 'category_value') required this.categoryValue});
  factory _CategoryBreakdownModel.fromJson(Map<String, dynamic> json) => _$CategoryBreakdownModelFromJson(json);

@override@JsonKey(name: 'category_id') final  int? categoryId;
@override@JsonKey(name: 'category_name') final  String categoryName;
@override@JsonKey(name: 'product_count') final  int productCount;
@override@JsonKey(name: 'total_quantity') final  int totalQuantity;
@override@JsonKey(name: 'category_value') final  double categoryValue;

/// Create a copy of CategoryBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryBreakdownModelCopyWith<_CategoryBreakdownModel> get copyWith => __$CategoryBreakdownModelCopyWithImpl<_CategoryBreakdownModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryBreakdownModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryBreakdownModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.categoryValue, categoryValue) || other.categoryValue == categoryValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,productCount,totalQuantity,categoryValue);

@override
String toString() {
  return 'CategoryBreakdownModel(categoryId: $categoryId, categoryName: $categoryName, productCount: $productCount, totalQuantity: $totalQuantity, categoryValue: $categoryValue)';
}


}

/// @nodoc
abstract mixin class _$CategoryBreakdownModelCopyWith<$Res> implements $CategoryBreakdownModelCopyWith<$Res> {
  factory _$CategoryBreakdownModelCopyWith(_CategoryBreakdownModel value, $Res Function(_CategoryBreakdownModel) _then) = __$CategoryBreakdownModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'product_count') int productCount,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'category_value') double categoryValue
});




}
/// @nodoc
class __$CategoryBreakdownModelCopyWithImpl<$Res>
    implements _$CategoryBreakdownModelCopyWith<$Res> {
  __$CategoryBreakdownModelCopyWithImpl(this._self, this._then);

  final _CategoryBreakdownModel _self;
  final $Res Function(_CategoryBreakdownModel) _then;

/// Create a copy of CategoryBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? categoryName = null,Object? productCount = null,Object? totalQuantity = null,Object? categoryValue = null,}) {
  return _then(_CategoryBreakdownModel(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryValue: null == categoryValue ? _self.categoryValue : categoryValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

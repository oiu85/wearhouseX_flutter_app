import 'dart:convert';
import '../../../../core/storage/app_storage_service.dart';
import '../../presentation/bloc/sales_state.dart';

/// Local data source for cart persistence
abstract class CartLocalDataSource {
  /// Save cart items to local storage
  Future<void> saveCartItems(List<CartItem> items);

  /// Load cart items from local storage
  Future<List<CartItem>> getCartItems();

  /// Clear cart items from local storage
  Future<void> clearCartItems();
}

/// Implementation of CartLocalDataSource
class CartLocalDataSourceImpl implements CartLocalDataSource {
  final AppStorageService storageService;

  CartLocalDataSourceImpl(this.storageService);

  @override
  Future<void> saveCartItems(List<CartItem> items) async {
    final jsonList = items.map((item) => {
      'productId': item.productId,
      'productName': item.productName,
      'price': item.price,
      'quantity': item.quantity,
      'availableQuantity': item.availableQuantity,
      'customPrice': item.customPrice,
      'pricePercentage': item.pricePercentage,
    }).toList();
    
    final jsonString = jsonEncode(jsonList);
    await storageService.saveCartItems(jsonString);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final jsonString = await storageService.getCartItems();
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList.map((json) {
        final map = json as Map<String, dynamic>;
        return CartItem(
          productId: map['productId'] as int,
          productName: map['productName'] as String,
          price: (map['price'] as num).toDouble(),
          quantity: map['quantity'] as int,
          availableQuantity: map['availableQuantity'] as int,
          customPrice: map['customPrice'] != null
              ? (map['customPrice'] as num).toDouble()
              : null,
          pricePercentage: map['pricePercentage'] != null
              ? (map['pricePercentage'] as num).toDouble()
              : null,
        );
      }).toList();
    } catch (e) {
      // If parsing fails, clear corrupted data
      await clearCartItems();
      return [];
    }
  }

  @override
  Future<void> clearCartItems() async {
    await storageService.clearCartItems();
  }
}

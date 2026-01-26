import 'package:equatable/equatable.dart';

/// Stock request events
abstract class StockRequestEvent extends Equatable {
  const StockRequestEvent();

  @override
  List<Object?> get props => [];
}

/// Initialize form with optional pre-selected product
class InitializeStockRequestForm extends StockRequestEvent {
  final int? productId;
  final String? productName;
  final int? initialQuantity;

  const InitializeStockRequestForm({
    this.productId,
    this.productName,
    this.initialQuantity,
  });

  @override
  List<Object?> get props => [productId, productName, initialQuantity];
}

/// Select product
class SelectProduct extends StockRequestEvent {
  final int productId;
  final int? warehouseStock; // Warehouse stock for the selected product

  const SelectProduct(this.productId, {this.warehouseStock});

  @override
  List<Object?> get props => [productId, warehouseStock];
}

/// Set quantity
class SetQuantity extends StockRequestEvent {
  final String quantity;

  const SetQuantity(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

/// Add product to cart
class AddProductToCart extends StockRequestEvent {
  final int productId;
  final String productName;
  final int quantity;
  final int warehouseStock;

  const AddProductToCart({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.warehouseStock,
  });

  @override
  List<Object?> get props => [productId, productName, quantity, warehouseStock];
}

/// Remove product from cart
class RemoveProductFromCart extends StockRequestEvent {
  final int productId;

  const RemoveProductFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Update product quantity in cart
class UpdateCartProductQuantity extends StockRequestEvent {
  final int productId;
  final int quantity;

  const UpdateCartProductQuantity(this.productId, this.quantity);

  @override
  List<Object?> get props => [productId, quantity];
}

/// Clear cart
class ClearCart extends StockRequestEvent {
  const ClearCart();
}

/// Validate form
class ValidateForm extends StockRequestEvent {
  const ValidateForm();
}

/// Submit stock request (single product - legacy)
class SubmitStockRequest extends StockRequestEvent {
  const SubmitStockRequest();
}

/// Submit multi-product stock request
class SubmitMultiProductRequest extends StockRequestEvent {
  const SubmitMultiProductRequest();
}

/// Load stock requests
class LoadStockRequests extends StockRequestEvent {
  const LoadStockRequests();
}

/// Reset stock request form
class ResetStockRequest extends StockRequestEvent {
  const ResetStockRequest();
}

/// Clear snackbar message
class ClearSnackbarMessage extends StockRequestEvent {
  const ClearSnackbarMessage();
}

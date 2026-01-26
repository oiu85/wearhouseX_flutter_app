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

/// Validate form
class ValidateForm extends StockRequestEvent {
  const ValidateForm();
}

/// Submit stock request
class SubmitStockRequest extends StockRequestEvent {
  const SubmitStockRequest();
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

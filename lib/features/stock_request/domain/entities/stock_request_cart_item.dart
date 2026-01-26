/// Stock request cart item entity
class StockRequestCartItem {
  final int productId;
  final String productName;
  final int quantity;
  final int warehouseStock;

  const StockRequestCartItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.warehouseStock,
  });

  StockRequestCartItem copyWith({
    int? productId,
    String? productName,
    int? quantity,
    int? warehouseStock,
  }) {
    return StockRequestCartItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      warehouseStock: warehouseStock ?? this.warehouseStock,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StockRequestCartItem && other.productId == productId;
  }

  @override
  int get hashCode => productId.hashCode;
}

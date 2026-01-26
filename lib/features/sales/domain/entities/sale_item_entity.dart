/// Sale item entity representing a product in a sale
class SaleItemEntity {
  final int productId;
  final String productName;
  final int quantity;
  final double price;
  final double subtotal;
  final double? customPrice;

  const SaleItemEntity({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.subtotal,
    this.customPrice,
  });
}

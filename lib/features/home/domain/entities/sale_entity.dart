/// Sale item entity
class SaleItemEntity {
  final String productName;
  final int quantity;
  final double price;
  final double subtotal;

  const SaleItemEntity({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
}

/// Sale entity
class SaleEntity {
  final int id;
  final String invoiceNumber;
  final String customerName;
  final double totalAmount;
  final DateTime createdAt;
  final List<SaleItemEntity> items;

  const SaleEntity({
    required this.id,
    required this.invoiceNumber,
    required this.customerName,
    required this.totalAmount,
    required this.createdAt,
    required this.items,
  });
}

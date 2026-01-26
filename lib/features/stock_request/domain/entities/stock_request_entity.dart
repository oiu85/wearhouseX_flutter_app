/// Stock request entity
class StockRequestEntity {
  final int id;
  final int productId;
  final String productName;
  final int quantity;
  final String status; // pending, approved, rejected
  final String? rejectionReason;
  final DateTime createdAt;

  const StockRequestEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.status,
    this.rejectionReason,
    required this.createdAt,
  });
}

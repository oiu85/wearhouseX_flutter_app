import 'sale_item_entity.dart';

/// Sale entity representing a completed sale
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

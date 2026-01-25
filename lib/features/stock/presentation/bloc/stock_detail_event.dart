import 'package:equatable/equatable.dart';

//* Stock detail events
abstract class StockDetailEvent extends Equatable {
  const StockDetailEvent();

  @override
  List<Object?> get props => [];
}

//* Load stock detail by ID
class LoadStockDetail extends StockDetailEvent {
  final int stockItemId;

  const LoadStockDetail(this.stockItemId);

  @override
  List<Object?> get props => [stockItemId];
}

//* Load stock detail by product ID
class LoadStockDetailByProductId extends StockDetailEvent {
  final int productId;

  const LoadStockDetailByProductId(this.productId);

  @override
  List<Object?> get props => [productId];
}

//* Reset stock detail state
class ResetStockDetail extends StockDetailEvent {
  const ResetStockDetail();
}

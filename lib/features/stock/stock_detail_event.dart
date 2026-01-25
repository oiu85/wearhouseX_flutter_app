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

//* Reset stock detail state
class ResetStockDetail extends StockDetailEvent {
  const ResetStockDetail();
}

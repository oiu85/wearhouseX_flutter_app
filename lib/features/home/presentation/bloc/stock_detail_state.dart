import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/stock_item_entity.dart';

//* Stock detail state
class StockDetailState extends Equatable {
  final BlocStatus status;
  final StockItemEntity? stockItem;
  final String? errorMessage;

  const StockDetailState({
    required this.status,
    this.stockItem,
    this.errorMessage,
  });

  factory StockDetailState.initial() => const StockDetailState(
        status: BlocStatus.initial(),
        stockItem: null,
        errorMessage: null,
      );

  StockDetailState copyWith({
    BlocStatus? status,
    StockItemEntity? stockItem,
    String? errorMessage,
  }) {
    return StockDetailState(
      status: status ?? this.status,
      stockItem: stockItem ?? this.stockItem,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, stockItem, errorMessage];
}

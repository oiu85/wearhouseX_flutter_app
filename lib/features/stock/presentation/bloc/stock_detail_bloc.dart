import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_detail_event.dart';
import 'stock_detail_state.dart';

//* Stock detail BLoC
class StockDetailBloc extends Bloc<StockDetailEvent, StockDetailState> {
  final StockRepository repository;

  StockDetailBloc({
    required this.repository,
  }) : super(StockDetailState.initial()) {
    on<LoadStockDetail>(_onLoadStockDetail);
    on<ResetStockDetail>(_onResetStockDetail);
  }

  Future<void> _onLoadStockDetail(
    LoadStockDetail event,
    Emitter<StockDetailState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getStockItemById(event.stockItemId);

    result.fold(
      (failure) {
        String errorMessage = failure.message;

        if (failure is NetworkFailure) {
          if (failure.message.contains('not found')) {
            errorMessage = 'Stock item not found.';
          } else if (failure.message.contains('connection')) {
            errorMessage = 'Connection error. Please check your internet.';
          }
        }

        emit(state.copyWith(
          status: BlocStatus.fail(error: errorMessage),
          errorMessage: errorMessage,
        ));
      },
      (stockItem) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          stockItem: stockItem,
          errorMessage: null,
        ));
      },
    );
  }

  void _onResetStockDetail(
    ResetStockDetail event,
    Emitter<StockDetailState> emit,
  ) {
    emit(StockDetailState.initial());
  }
}

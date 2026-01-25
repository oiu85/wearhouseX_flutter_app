import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/storage/app_storage_service.dart';
import 'menu_event.dart';
import 'menu_state.dart';

/// Menu BLoC
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final AppStorageService storageService;

  MenuBloc({
    required this.storageService,
  }) : super(MenuState.initial()) {
    on<LoadUserInfo>(_onLoadUserInfo);
  }

  Future<void> _onLoadUserInfo(
    LoadUserInfo event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    try {
      final userInfo = await storageService.getUserInfo();

      emit(state.copyWith(
        status: const BlocStatus.success(),
        userInfo: userInfo,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.fail(error: e.toString()),
        errorMessage: e.toString(),
      ));
    }
  }
}

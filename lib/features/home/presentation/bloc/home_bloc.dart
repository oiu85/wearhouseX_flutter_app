import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Home BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  final AppStorageService storageService;

  HomeBloc({
    required this.repository,
    required this.storageService,
  }) : super(HomeState.initial()) {
    on<LoadUserInfo>(_onLoadUserInfo);
    on<LoadDashboard>(_onLoadDashboard);
    on<RefreshDashboard>(_onRefreshDashboard);
  }

  Future<void> _onLoadUserInfo(
    LoadUserInfo event,
    Emitter<HomeState> emit,
  ) async {
    final userInfo = await storageService.getUserInfo();
    final userName = userInfo?['name'] as String?;
    
    if (userName != null) {
      final greetingText = _getGreeting(userName);
      emit(state.copyWith(
        userName: userName,
        greetingText: greetingText,
      ));
    } else {
      final greetingText = _getGreeting('Driver');
      emit(state.copyWith(
        userName: 'Driver',
        greetingText: greetingText,
      ));
    }
  }

  String _getGreeting(String name) {
    final hour = DateTime.now().hour;
    
    if (hour >= 5 && hour < 12) {
      return 'home.greetingMorning'.tr(namedArgs: {'name': name});
    } else if (hour >= 12 && hour < 17) {
      return 'home.greetingAfternoon'.tr(namedArgs: {'name': name});
    } else if (hour >= 17 && hour < 22) {
      return 'home.greetingEvening'.tr(namedArgs: {'name': name});
    } else {
      return 'home.greeting'.tr(namedArgs: {'name': name});
    }
  }

  Future<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final statsResult = await repository.getDriverStats();
    final salesResult = await repository.getRecentSales(limit: 10);

    statsResult.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (stats) {
        salesResult.fold(
          (failure) {
            emit(state.copyWith(
              status: BlocStatus.fail(error: failure.message),
              errorMessage: failure.message,
            ));
          },
          (sales) {
            emit(state.copyWith(
              status: const BlocStatus.success(),
              driverStats: stats,
              recentSales: sales,
              errorMessage: null,
            ));
          },
        );
      },
    );
  }

  Future<void> _onRefreshDashboard(
    RefreshDashboard event,
    Emitter<HomeState> emit,
  ) async {
    final statsResult = await repository.getDriverStats();
    final salesResult = await repository.getRecentSales(limit: 10);

    statsResult.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (stats) {
        salesResult.fold(
          (failure) {
            emit(state.copyWith(
              status: BlocStatus.fail(error: failure.message),
              errorMessage: failure.message,
            ));
          },
          (sales) {
            emit(state.copyWith(
              status: const BlocStatus.success(),
              driverStats: stats,
              recentSales: sales,
              errorMessage: null,
            ));
          },
        );
      },
    );
  }
}

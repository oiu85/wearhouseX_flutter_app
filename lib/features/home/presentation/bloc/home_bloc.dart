import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/entities/driver_stats_entity.dart';
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
    on<NavigateToCreateSale>(_onNavigateToCreateSale);
    on<NavigateToStock>(_onNavigateToStock);
    on<NavigateToSalesHistory>(_onNavigateToSalesHistory);
    on<NavigateToStockDetail>(_onNavigateToStockDetail);
    on<NavigateToSaleDetail>(_onNavigateToSaleDetail);
    on<NavigateToNotifications>(_onNavigateToNotifications);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearNavigationRoute>(_onClearNavigationRoute);
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
      return LocaleKeys.home_greetingMorning.tr(namedArgs: {'name': name});
    } else if (hour >= 12 && hour < 17) {
      return LocaleKeys.home_greetingAfternoon.tr(namedArgs: {'name': name});
    } else if (hour >= 17 && hour < 22) {
      return LocaleKeys.home_greetingEvening.tr(namedArgs: {'name': name});
    } else {
      return LocaleKeys.home_greeting.tr(namedArgs: {'name': name});
    }
  }

  Future<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    // Try to get dashboard data first (new API)
    final dashboardResult = await repository.getDashboard();

    dashboardResult.fold(
      (failure) {
        // Fallback to old API if dashboard fails
        // Use unawaited to prevent blocking, but ensure we await in _loadLegacyDashboard
        _loadLegacyDashboard(emit);
      },
      (dashboard) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: const BlocStatus.success(),
            dashboard: dashboard,
            recentSales: dashboard.recentSales,
            driverStats: DriverStatsEntity(
              totalSales: 0, // Not in dashboard
              totalRevenue: 0.0, // Not in dashboard
              todaySales: dashboard.quickStats.todaySales,
              todayRevenue: dashboard.quickStats.todayRevenue,
              totalStockItems: dashboard.quickStats.availableProducts,
            ),
            errorMessage: null,
          ));
        }
      },
    );
  }

  void _loadLegacyDashboard(Emitter<HomeState> emit) {
    // Start async operations but don't block the event handler
    _loadLegacyDashboardAsync(emit);
  }

  Future<void> _loadLegacyDashboardAsync(Emitter<HomeState> emit) async {
    // Check if emit is still valid before proceeding
    if (emit.isDone) return;

    final statsResult = await repository.getDriverStats();
    
    // Check again after async operation
    if (emit.isDone) return;

    statsResult.fold(
      (failure) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: BlocStatus.fail(error: failure.message),
            errorMessage: failure.message,
          ));
        }
      },
      (stats) {
        // Load sales in parallel or sequentially
        _loadSalesForLegacyDashboard(emit, stats);
      },
    );
  }

  Future<void> _loadSalesForLegacyDashboard(
    Emitter<HomeState> emit,
    DriverStatsEntity stats,
  ) async {
    if (emit.isDone) return;

    final salesResult = await repository.getRecentSales(limit: 10);

    // Check again after async operation
    if (emit.isDone) return;

    salesResult.fold(
      (failure) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: BlocStatus.fail(error: failure.message),
            errorMessage: failure.message,
          ));
        }
      },
      (sales) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: const BlocStatus.success(),
            driverStats: stats,
            recentSales: sales,
            errorMessage: null,
          ));
        }
      },
    );
  }

  Future<void> _onRefreshDashboard(
    RefreshDashboard event,
    Emitter<HomeState> emit,
  ) async {
    // Emit loading state for refresh
    emit(state.copyWith(status: const BlocStatus.loading()));

    // Try to get dashboard data first (new API)
    final dashboardResult = await repository.getDashboard();

    dashboardResult.fold(
      (failure) {
        // Fallback to old API if dashboard fails
        _loadLegacyDashboardForRefresh(emit);
      },
      (dashboard) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: const BlocStatus.success(),
            dashboard: dashboard,
            recentSales: dashboard.recentSales,
            driverStats: DriverStatsEntity(
              totalSales: 0, // Not in dashboard
              totalRevenue: 0.0, // Not in dashboard
              todaySales: dashboard.quickStats.todaySales,
              todayRevenue: dashboard.quickStats.todayRevenue,
              totalStockItems: dashboard.quickStats.availableProducts,
            ),
            errorMessage: null,
          ));
        }
      },
    );
  }

  void _loadLegacyDashboardForRefresh(Emitter<HomeState> emit) {
    // Start async operations but don't block the event handler
    _loadLegacyDashboardForRefreshAsync(emit);
  }

  Future<void> _loadLegacyDashboardForRefreshAsync(Emitter<HomeState> emit) async {
    // Check if emit is still valid before proceeding
    if (emit.isDone) return;

    final statsResult = await repository.getDriverStats();
    
    // Check again after async operation
    if (emit.isDone) return;

    statsResult.fold(
      (failure) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: BlocStatus.fail(error: failure.message),
            errorMessage: failure.message,
          ));
        }
      },
      (stats) {
        // Load sales in parallel or sequentially
        _loadSalesForLegacyDashboardRefresh(emit, stats);
      },
    );
  }

  Future<void> _loadSalesForLegacyDashboardRefresh(
    Emitter<HomeState> emit,
    DriverStatsEntity stats,
  ) async {
    if (emit.isDone) return;

    final salesResult = await repository.getRecentSales(limit: 10);

    // Check again after async operation
    if (emit.isDone) return;

    salesResult.fold(
      (failure) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: BlocStatus.fail(error: failure.message),
            errorMessage: failure.message,
          ));
        }
      },
      (sales) {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: const BlocStatus.success(),
            driverStats: stats,
            recentSales: sales,
            errorMessage: null,
          ));
        }
      },
    );
  }

  void _onNavigateToCreateSale(
    NavigateToCreateSale event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationRoute: '/sales/create'));
  }

  void _onNavigateToStock(
    NavigateToStock event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationRoute: '/stock'));
  }

  void _onNavigateToSalesHistory(
    NavigateToSalesHistory event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationRoute: '/sales/history'));
  }

  void _onNavigateToStockDetail(
    NavigateToStockDetail event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationRoute: '/stock/product/${event.productId}'));
  }

  void _onNavigateToSaleDetail(
    NavigateToSaleDetail event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      navigationRoute: AppRoutes.saleDetail.replaceAll(':id', event.saleId.toString()),
    ));
  }

  void _onNavigateToNotifications(
    NavigateToNotifications event,
    Emitter<HomeState> emit,
  ) {
    // TODO: Navigate to notifications page when implemented
    // For now, emit a route that will show coming soon message
    emit(state.copyWith(navigationRoute: '/notifications'));
  }

  void _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
    // TODO: Implement search functionality
    // For now, if query is not empty, could navigate to stock with search
    if (event.query.isNotEmpty) {
      // Could emit navigation to stock with search query
      // emit(state.copyWith(navigationRoute: '/stock?search=${event.query}'));
    }
  }

  void _onClearNavigationRoute(
    ClearNavigationRoute event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationRoute: null));
  }
}

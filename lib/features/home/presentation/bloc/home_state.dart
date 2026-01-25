import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/driver_stats_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/dashboard_entity.dart';

/// Home state
class HomeState extends Equatable {
  final BlocStatus status;
  final DriverStatsEntity? driverStats;
  final DashboardEntity? dashboard;
  final List<SaleEntity> recentSales;
  final String? errorMessage;
  final String? userName;
  final String? greetingText;
  final String? navigationRoute;
  final String searchQuery;
  final int notificationCount;

  const HomeState({
    required this.status,
    this.driverStats,
    this.dashboard,
    required this.recentSales,
    this.errorMessage,
    this.userName,
    this.greetingText,
    this.navigationRoute,
    this.searchQuery = '',
    this.notificationCount = 0,
  });

  factory HomeState.initial() => const HomeState(
        status: BlocStatus.initial(),
        driverStats: null,
        dashboard: null,
        recentSales: [],
        errorMessage: null,
        userName: null,
        greetingText: null,
        navigationRoute: null,
        searchQuery: '',
        notificationCount: 0,
      );

  HomeState copyWith({
    BlocStatus? status,
    DriverStatsEntity? driverStats,
    DashboardEntity? dashboard,
    List<SaleEntity>? recentSales,
    String? errorMessage,
    String? userName,
    String? greetingText,
    String? navigationRoute,
    String? searchQuery,
    int? notificationCount,
  }) {
    return HomeState(
      status: status ?? this.status,
      driverStats: driverStats ?? this.driverStats,
      dashboard: dashboard ?? this.dashboard,
      recentSales: recentSales ?? this.recentSales,
      errorMessage: errorMessage ?? this.errorMessage,
      userName: userName ?? this.userName,
      greetingText: greetingText ?? this.greetingText,
      navigationRoute: navigationRoute,
      searchQuery: searchQuery ?? this.searchQuery,
      notificationCount: notificationCount ?? this.notificationCount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        driverStats,
        dashboard,
        recentSales,
        errorMessage,
        userName,
        greetingText,
        navigationRoute,
        searchQuery,
        notificationCount,
      ];
}

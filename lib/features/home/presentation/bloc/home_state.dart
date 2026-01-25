import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/driver_stats_entity.dart';
import '../../domain/entities/sale_entity.dart';

/// Home state
class HomeState extends Equatable {
  final BlocStatus status;
  final DriverStatsEntity? driverStats;
  final List<SaleEntity> recentSales;
  final String? errorMessage;
  final String? userName;
  final String? greetingText;

  const HomeState({
    required this.status,
    this.driverStats,
    required this.recentSales,
    this.errorMessage,
    this.userName,
    this.greetingText,
  });

  factory HomeState.initial() => const HomeState(
        status: BlocStatus.initial(),
        driverStats: null,
        recentSales: [],
        errorMessage: null,
        userName: null,
        greetingText: null,
      );

  HomeState copyWith({
    BlocStatus? status,
    DriverStatsEntity? driverStats,
    List<SaleEntity>? recentSales,
    String? errorMessage,
    String? userName,
    String? greetingText,
  }) {
    return HomeState(
      status: status ?? this.status,
      driverStats: driverStats ?? this.driverStats,
      recentSales: recentSales ?? this.recentSales,
      errorMessage: errorMessage ?? this.errorMessage,
      userName: userName ?? this.userName,
      greetingText: greetingText ?? this.greetingText,
    );
  }

  @override
  List<Object?> get props => [
        status,
        driverStats,
        recentSales,
        errorMessage,
        userName,
        greetingText,
      ];
}

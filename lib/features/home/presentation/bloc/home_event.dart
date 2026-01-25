import 'package:equatable/equatable.dart';

/// Home events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load dashboard data
class LoadDashboard extends HomeEvent {
  const LoadDashboard();
}

/// Refresh dashboard data
class RefreshDashboard extends HomeEvent {
  const RefreshDashboard();
}

/// Load user information from storage
class LoadUserInfo extends HomeEvent {
  const LoadUserInfo();
}

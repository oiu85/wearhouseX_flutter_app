import 'package:equatable/equatable.dart';

/// Profile events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Load profile
class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

/// Logout user
class Logout extends ProfileEvent {
  const Logout();
}

/// Reset profile state
class ResetProfile extends ProfileEvent {
  const ResetProfile();
}

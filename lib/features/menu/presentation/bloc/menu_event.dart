import 'package:equatable/equatable.dart';

/// Menu events
abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

/// Load user information from storage
class LoadUserInfo extends MenuEvent {
  const LoadUserInfo();
}

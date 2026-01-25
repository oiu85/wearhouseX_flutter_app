import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';

/// Menu state
class MenuState extends Equatable {
  final BlocStatus status;
  final Map<String, dynamic>? userInfo;
  final String? errorMessage;

  const MenuState({
    required this.status,
    this.userInfo,
    this.errorMessage,
  });

  factory MenuState.initial() => const MenuState(
        status: BlocStatus.initial(),
        userInfo: null,
        errorMessage: null,
      );

  MenuState copyWith({
    BlocStatus? status,
    Map<String, dynamic>? userInfo,
    String? errorMessage,
  }) {
    return MenuState(
      status: status ?? this.status,
      userInfo: userInfo ?? this.userInfo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        userInfo,
        errorMessage,
      ];
}

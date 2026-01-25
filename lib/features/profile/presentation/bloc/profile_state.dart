import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../auth/domain/entities/user_entity.dart';

/// Profile state
class ProfileState extends Equatable {
  final BlocStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const ProfileState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  factory ProfileState.initial() => const ProfileState(
        status: BlocStatus.initial(),
        user: null,
        errorMessage: null,
      );

  ProfileState copyWith({
    BlocStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}

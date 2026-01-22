import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/user_entity.dart';

// ============================================
// LOGIN STATE
// ============================================

class LoginState extends Equatable {
  final BlocStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const LoginState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  factory LoginState.initial() => const LoginState(
        status: BlocStatus.initial(),
        user: null,
        errorMessage: null,
      );

  LoginState copyWith({
    BlocStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}

// ============================================
// FORGOT PASSWORD STATE
// ============================================

class ForgotPasswordState extends Equatable {
  final BlocStatus status;
  final String? successMessage;
  final String? errorMessage;

  const ForgotPasswordState({
    required this.status,
    this.successMessage,
    this.errorMessage,
  });

  factory ForgotPasswordState.initial() => const ForgotPasswordState(
        status: BlocStatus.initial(),
        successMessage: null,
        errorMessage: null,
      );

  ForgotPasswordState copyWith({
    BlocStatus? status,
    String? successMessage,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, successMessage, errorMessage];
}

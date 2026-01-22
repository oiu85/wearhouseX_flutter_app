import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

// ============================================
// LOGIN BLOC
// ============================================

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc({
    required this.repository,
  }) : super(LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginReset>(_onLoginReset);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.login(
      email: event.email.trim(),
      password: event.password,
    );

    result.fold(
      (failure) {
        String errorMessage = failure.message;
        
        if (failure is AuthFailure) {
          errorMessage = 'Authentication failed. Please check your credentials.';
        } else if (failure is NetworkFailure) {
          if (failure.message.contains('401') || 
              failure.message.contains('403') ||
              failure.message.contains('credentials')) {
            errorMessage = 'Invalid email or password.';
          } else if (failure.message.contains('connection') ||
                     failure.message.contains('timeout')) {
            errorMessage = 'Connection error. Please check your internet.';
          }
        }

        emit(state.copyWith(
          status: BlocStatus.fail(error: errorMessage),
          errorMessage: errorMessage,
        ));
      },
      (user) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          user: user,
          errorMessage: null,
        ));
      },
    );
  }

  void _onLoginReset(
    LoginReset event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginState.initial());
  }
}

// ============================================
// FORGOT PASSWORD BLOC
// ============================================

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository repository;

  ForgotPasswordBloc({
    required this.repository,
  }) : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
    on<ForgotPasswordReset>(_onForgotPasswordReset);
  }

  Future<void> _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.forgotPassword(
      email: event.email.trim(),
    );

    result.fold(
      (failure) {
        String errorMessage = failure.message;
        
        if (failure is NetworkFailure) {
          if (failure.message.contains('connection') ||
              failure.message.contains('timeout')) {
            errorMessage = 'Connection error. Please check your internet.';
          } else if (failure.message.contains('404')) {
            errorMessage = 'Email not found. Please check your email address.';
          }
        }

        emit(state.copyWith(
          status: BlocStatus.fail(error: errorMessage),
          errorMessage: errorMessage,
          successMessage: null,
        ));
      },
      (_) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          successMessage: 'Password reset link has been sent to your email.',
          errorMessage: null,
        ));
      },
    );
  }

  void _onForgotPasswordReset(
    ForgotPasswordReset event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordState.initial());
  }
}

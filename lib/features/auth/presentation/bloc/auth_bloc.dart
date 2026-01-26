import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/services/fcm_service.dart';
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
      (user) async {
        // Register FCM token after successful login
        try {
          final fcmService = GetIt.instance<FcmService>();
          await fcmService.initialize();
        } catch (e) {
          // FCM registration failure shouldn't block login
          debugPrint('Failed to register FCM token: $e');
        }

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

// ============================================
// RESET PASSWORD BLOC
// ============================================

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository repository;

  ResetPasswordBloc({
    required this.repository,
  }) : super(ResetPasswordState.initial()) {
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
    on<ResetPasswordReset>(_onResetPasswordReset);
  }

  Future<void> _onResetPasswordSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.resetPassword(
      email: event.email.trim(),
      token: event.token.trim(),
      password: event.password,
      passwordConfirmation: event.passwordConfirmation,
    );

    result.fold(
      (failure) {
        String errorMessage = failure.message;

        if (failure is NetworkFailure) {
          if (failure.message.contains('connection') ||
              failure.message.contains('timeout')) {
            errorMessage = 'Connection error. Please check your internet.';
          } else if (failure.message.contains('token') ||
              failure.message.contains('expired')) {
            errorMessage = 'Invalid or expired reset token.';
          } else if (failure.message.contains('password') ||
              failure.message.contains('validation')) {
            errorMessage = 'Password validation failed. Please check your input.';
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
          successMessage: 'Password has been reset successfully.',
          errorMessage: null,
        ));
      },
    );
  }

  void _onResetPasswordReset(
    ResetPasswordReset event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(ResetPasswordState.initial());
  }
}

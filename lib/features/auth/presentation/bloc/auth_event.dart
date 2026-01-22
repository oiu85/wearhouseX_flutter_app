import 'package:equatable/equatable.dart';

// ============================================
// LOGIN EVENTS
// ============================================

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  const LoginSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class LoginReset extends LoginEvent {
  const LoginReset();
}

// ============================================
// FORGOT PASSWORD EVENTS
// ============================================

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordSubmitted(this.email);

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordReset extends ForgotPasswordEvent {
  const ForgotPasswordReset();
}

import 'package:dartz/dartz.dart';
import '../entities/failure.dart';
import '../entities/user_entity.dart';

/// Abstract repository for authentication operations
abstract class AuthRepository {
  /// Login with email and password
  /// Returns UserEntity on success, Failure on error
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  /// Logout current user
  /// Returns void on success, Failure on error
  Future<Either<Failure, void>> logout();

  /// Get current authenticated user
  /// Returns UserEntity on success, Failure on error
  Future<Either<Failure, UserEntity>> getCurrentUser();

  /// Request password reset
  /// Returns void on success, Failure on error
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  });

  /// Reset password with token
  /// Returns void on success, Failure on error
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  });
}

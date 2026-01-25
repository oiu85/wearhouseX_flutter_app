import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/auth_models.dart';

/// Remote data source for authentication API calls
abstract class AuthRemoteDataSource {
  /// Login with email and password
  Future<Either<NetworkFailure, LoginResponseModel>> login({
    required String email,
    required String password,
  });

  /// Logout current user
  Future<Either<NetworkFailure, void>> logout();

  /// Get current authenticated user
  Future<Either<NetworkFailure, Map<String, dynamic>>> getCurrentUser();

  /// Request password reset
  Future<Either<NetworkFailure, void>> forgotPassword({
    required String email,
  });

  /// Reset password with token
  Future<Either<NetworkFailure, void>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  });
}

/// Implementation of AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkClient networkClient;

  AuthRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    final result = await networkClient.post(
      ApiConfig.driverLogin,
      data: {
        'email': email,
        'password': password,
      },
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final loginResponse = LoginResponseModel.fromJson(data);
          return Right(loginResponse);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse login response: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, void>> logout() async {
    final result = await networkClient.post(ApiConfig.logout);

    return result.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }

  @override
  Future<Either<NetworkFailure, Map<String, dynamic>>> getCurrentUser() async {
    final result = await networkClient.get(ApiConfig.me);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          return Right(data);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse user data: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, void>> forgotPassword({
    required String email,
  }) async {
    final result = await networkClient.post(
      ApiConfig.forgotPassword,
      data: {
        'email': email,
      },
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }

  @override
  Future<Either<NetworkFailure, void>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    final result = await networkClient.post(
      ApiConfig.resetPassword,
      data: {
        'email': email,
        'token': token,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }
}

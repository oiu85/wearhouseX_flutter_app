import 'package:dartz/dartz.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/entities/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_datasource.dart';
import '../models/auth_models.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AppStorageService storageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.storageService,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await remoteDataSource.login(
      email: email,
      password: password,
    );

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (loginResponse) async {
        // Store token
        await storageService.setAccessToken(loginResponse.token);
        // Store full user information
        await storageService.setUserId(loginResponse.user.id);
        await storageService.setUserName(loginResponse.user.name);
        await storageService.setUserEmail(loginResponse.user.email);
        await storageService.setUserType(loginResponse.user.type);
        // Set guest mode to false
        await storageService.setGuestMode(false);

        return Right(loginResponse.user.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    final result = await remoteDataSource.logout();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (_) async {
        // Clear token and user data
        await storageService.setAccessToken(null);
        await storageService.clearUserData();
        await storageService.setGuestMode(true);

        return const Right(null);
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final result = await remoteDataSource.getCurrentUser();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (userData) {
        try {
          final userModel = UserModel.fromJson(userData);
          return Right(userModel.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to parse user data: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  }) async {
    final result = await remoteDataSource.forgotPassword(email: email);

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (_) => const Right(null),
    );
  }
}

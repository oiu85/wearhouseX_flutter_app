import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../../../auth/data/models/auth_models.dart';
import '../../../../core/storage/app_storage_service.dart';

/// Implementation of ProfileRepository
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final AppStorageService storageService;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.storageService,
  });

  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    final result = await remoteDataSource.getProfile();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (userModel) {
        try {
          return Right(userModel.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert profile: ${e.toString()}'),
          );
        }
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
}

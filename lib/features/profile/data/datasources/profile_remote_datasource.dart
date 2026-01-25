import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../../../auth/data/models/auth_models.dart';

/// Remote data source for profile API calls
abstract class ProfileRemoteDataSource {
  /// Get current user profile
  Future<Either<NetworkFailure, UserModel>> getProfile();

  /// Logout current user
  Future<Either<NetworkFailure, void>> logout();
}

/// Implementation of ProfileRemoteDataSource
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final NetworkClient networkClient;

  ProfileRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, UserModel>> getProfile() async {
    final result = await networkClient.get(ApiConfig.me);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final userData = data['data'] as Map<String, dynamic>;
          final user = UserModel.fromJson(userData);
          return Right(user);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse profile data: ${e.toString()}',
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
}

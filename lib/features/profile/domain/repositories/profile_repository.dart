import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';

/// Abstract repository for profile operations
abstract class ProfileRepository {
  /// Get current user profile
  Future<Either<Failure, UserEntity>> getProfile();

  /// Logout current user
  Future<Either<Failure, void>> logout();
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

/// Profile BLoC
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({
    required this.repository,
  }) : super(ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<Logout>(_onLogout);
    on<ResetProfile>(_onResetProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getProfile();

    result.fold(
      (failure) {
        String errorMessage = failure.message;

        if (failure is NetworkFailure) {
          if (failure.message.contains('connection') ||
              failure.message.contains('timeout')) {
            errorMessage = 'Connection error. Please check your internet.';
          } else if (failure.message.contains('401') ||
              failure.message.contains('unauthorized')) {
            errorMessage = 'Session expired. Please login again.';
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

  Future<void> _onLogout(
    Logout event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.logout();

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          errorMessage: null,
        ));
      },
    );
  }

  void _onResetProfile(
    ResetProfile event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileState.initial());
  }
}

import 'dart:core';

enum Status {
  initial,
  loading,
  loadingMore,
  success,
  fail,
}

class BlocStatus {
  final Status status;
  final String? error;

  const BlocStatus.loading()
      : status = Status.loading,
        error = null;

  const BlocStatus.loadingMore()
      : status = Status.loadingMore,
        error = null;

  const BlocStatus.success()
      : status = Status.success,
        error = null;

  const BlocStatus.fail({
    required this.error,
  }) : status = Status.fail;

  const BlocStatus.initial()
      : status = Status.initial,
        error = null;

  bool isLoading() => status == Status.loading;

  bool isLoadingMore() => status == Status.loadingMore;

  bool isInitial() => status == Status.initial;

  bool isFail() => status == Status.fail;

  bool isSuccess() => status == Status.success;

  /// Pattern matching method similar to sealed class `.when()`
  /// Handles all status cases: init, loading, loadingMore, success, fail
  T when<T>({
    required T Function() init,
    required T Function() loading,
    required T Function() loadingMore,
    required T Function() success,
    required T Function(String error) fail,
  }) {
    switch (status) {
      case Status.initial:
        return init();
      case Status.loading:
        return loading();
      case Status.loadingMore:
        return loadingMore();
      case Status.success:
        return success();
      case Status.fail:
        return fail(error ?? 'Unknown error');
    }
  }
}

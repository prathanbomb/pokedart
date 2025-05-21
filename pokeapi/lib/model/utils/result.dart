/// A class that represents the result of an operation that can either
/// succeed with a value or fail with an error.
class Result<T> {
  final T? _value;
  final Object? _error;
  final bool _isSuccess;

  /// Creates a successful result with a value.
  Result.success(T value)
      : _value = value,
        _error = null,
        _isSuccess = true;

  /// Creates a failed result with an error.
  Result.failure(Object error)
      : _value = null,
        _error = error,
        _isSuccess = false;

  /// Whether the result is a success.
  bool get isSuccess => _isSuccess;

  /// Whether the result is a failure.
  bool get isFailure => !_isSuccess;

  /// The success value. Only access this when [isSuccess] is true.
  T get value {
    if (!isSuccess) {
      throw StateError('Cannot get value from a failure result.');
    }
    return _value as T;
  }

  /// The error object. Only access this when [isFailure] is true.
  Object get error {
    if (!isFailure) {
      throw StateError('Cannot get error from a success result.');
    }
    return _error!;
  }

  /// Returns the value if the result is a success, otherwise returns [defaultValue].
  T getOrDefault(T defaultValue) {
    return isSuccess ? value : defaultValue;
  }

  /// Transforms the success value using [mapper].
  Result<R> map<R>(R Function(T) mapper) {
    if (isSuccess) {
      try {
        return Result.success(mapper(value));
      } catch (e) {
        return Result.failure(e);
      }
    } else {
      return Result.failure(error);
    }
  }

  /// Runs [onSuccess] if the result is a success, otherwise runs [onFailure].
  void fold({
    required void Function(T) onSuccess,
    required void Function(Object) onFailure,
  }) {
    if (isSuccess) {
      onSuccess(value);
    } else {
      onFailure(error);
    }
  }

  /// Runs [onSuccess] if the result is a success.
  void onSuccess(void Function(T) onSuccess) {
    if (isSuccess) {
      onSuccess(value);
    }
  }

  /// Runs [onFailure] if the result is a failure.
  void onFailure(void Function(Object) onFailure) {
    if (isFailure) {
      onFailure(error);
    }
  }
}

/// Extension methods for futures that return Results.
extension FutureResultExtension<T> on Future<Result<T>> {
  /// Transforms the success value using [mapper] once the future completes.
  Future<Result<R>> map<R>(R Function(T) mapper) async {
    final result = await this;
    return result.map(mapper);
  }

  /// Provides a default value if the future completes with an error.
  Future<T> getOrDefault(T defaultValue) async {
    final result = await this;
    return result.getOrDefault(defaultValue);
  }
}

/// Extension methods for handling nullable values with Results.
extension ResultNullableExtension<T> on T? {
  /// Converts a nullable value to a Result.
  /// 
  /// Returns a success with the value if it's not null,
  /// otherwise returns a failure with the provided error.
  Result<T> asResult({Object errorIfNull = const NullValueError()}) {
    final value = this;
    if (value == null) {
      return Result.failure(errorIfNull);
    }
    return Result.success(value);
  }
}

/// Error thrown when a nullable value is null.
class NullValueError implements Exception {
  /// Optional message explaining which value was null.
  final String? message;

  /// Creates a new [NullValueError] with an optional message.
  const NullValueError([this.message]);

  @override
  String toString() {
    if (message == null) {
      return 'NullValueError: Value was null';
    }
    return 'NullValueError: $message';
  }
}

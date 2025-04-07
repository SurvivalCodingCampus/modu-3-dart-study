sealed class Result<T, D> {
  const factory Result.success(T data) = Success;

  const factory Result.error(D error) = Error;
}

class Success<T, D> implements Result<T, D> {
  final T data;

  const Success(this.data);
}

class Error<T, D> implements Result<T, D> {
  final D error;

  const Error(this.error);
}

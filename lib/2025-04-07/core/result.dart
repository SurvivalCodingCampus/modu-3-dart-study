sealed class Result<D, E> {
  const factory Result.success(D data) = Success;
  const factory Result.error(E error) = Error;
}

class Success<D, E> implements Result<D, E> {
  final D data;
  const Success(this.data);
}

class Error<D, E> implements Result<D, E> {
  final E error;
  const Error(this.error);
}
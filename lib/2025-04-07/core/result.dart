sealed class Result<D, E> {
  const Result();

  factory Result.success(D data) => Success(data);

  factory Result.error(E error) => Error(error);
}

final class Success<D, E> extends Result<D, E> {
  final D data;

  const Success(this.data);
}

final class Error<D, E> extends Result<D, E> {
  final E error;

  const Error(this.error);
}

sealed class Result<D, E> {
  factory Result.success(D data) = Success;
  factory Result.error(E error) = Error;
}

class Success<D, E> implements Result<D, E> {
  final D data;
  Success(this.data);
}

class Error<D, E> implements Result<D, E> {
  final E error;
  Error(this.error);
}

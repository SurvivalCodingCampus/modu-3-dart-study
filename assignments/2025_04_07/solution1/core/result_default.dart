sealed class ResultDefault<D, E> {
  factory ResultDefault.success(D data) = Success;
  factory ResultDefault.error(E error) = Error;
}

class Success<D, E> implements ResultDefault<D, E> {
  final D data;

  Success(this.data);
}

class Error<D, E> implements ResultDefault<D, E> {
  final E error;

  Error(this.error);
}

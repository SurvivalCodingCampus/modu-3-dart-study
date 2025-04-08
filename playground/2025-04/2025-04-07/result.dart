sealed class Result<T> {
  factory Result.success(T value) = Success<T>;
  factory Result.failure(String error) = Failure<T>;
}

class Success<T> implements Result<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> implements Result<T> {
  final String error;
  const Failure(this.error);
}

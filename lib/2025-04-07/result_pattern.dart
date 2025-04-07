sealed class Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;

  Error(this.message);
}

Result<int> calculate(int a, int b) {
  try {
    if (a == 0) {
      return Result.error('a is zero');
    }
    if (b == 0) {
      return Result.error('b is zero');
    }
    return Result.success(a ~/ b);
  } catch (e) {
    throw ('예상치 못한 에러 $e');
  }
}

void main() {
  final Result<int> result = calculate(0, 10);

  switch (result) {
    case Success<int>():
      print(result.data);
    case Error<int>():
      print(result.message); // 에러 메세지 보낸다.
  }
}

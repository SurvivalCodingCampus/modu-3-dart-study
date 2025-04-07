import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String message) = Error;
}

Result<int> calculate(int a, int b) {
  try {
    if (a == 0) {
      return Result.error('a is zero');
    }
    if (b == 0) {
      return Result.error('a is zero');
    }

    return Result.success(a ~/ b);
  } catch (e) {
    return Result.error('예상치 못한 에러');
  }
}

void main() {
  final Result<int> result = calculate(10, 10);

  switch(result) {
    case Success<int>():
      // smart casting
      print(result.data);
    case Error<int>():
      print(result.message);
  }
}


import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T, E extends Exception> with _$Reuslt<T, E> {
  const factory Result.success(T data) = Success;
  const factory Result.error(E e) = Error;
}

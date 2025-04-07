import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<D, E> with _$Result<D, E> {
  factory Result.success(D data) = Success;
  factory Result.error(E error) = Error;
}

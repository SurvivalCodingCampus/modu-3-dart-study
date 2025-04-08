import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<User, E> with _$Result<User, E> {
  const factory Result.success(User data) = Success;

  const factory Result.error(E error) = Error;
}

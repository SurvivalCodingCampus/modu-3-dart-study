import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<D, E> with _$Result {
  factory Result.success(D data) = Success;
  factory Result.error(E error) = Error;
}

enum RegistrationError {
  invalidEmail,
  weakPassword,
  networkError,
}
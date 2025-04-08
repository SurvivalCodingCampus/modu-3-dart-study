import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<S, F> with _$Result<S, F> {
  const factory Result.success(S value) = Success<S, F>;
  const factory Result.error(F error) = Error<S, F>;
}

enum RegistrationError {
  invalidEmail,
  weakPassword,
  networkError,
}

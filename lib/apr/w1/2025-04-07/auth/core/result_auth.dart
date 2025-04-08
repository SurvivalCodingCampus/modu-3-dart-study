import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_auth.freezed.dart';

@freezed
sealed class Result<D, RegistrationError> with _$Result<D, RegistrationError> {
  const factory Result.success(D data) = Success;

  const factory Result.error(RegistrationError e) = Error;
}

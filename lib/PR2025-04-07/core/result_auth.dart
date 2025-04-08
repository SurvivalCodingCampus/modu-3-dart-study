import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_auth.freezed.dart';

@freezed
sealed class ResultAuth<User, E> with _$ResultAuth<User, E> {
  const factory ResultAuth.success(User data) = Success;

  const factory ResultAuth.error(E error) = Error;
}

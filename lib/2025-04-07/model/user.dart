import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
// ignore_for_file: annotate_overrides
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String password,
    required DateTime createdAt,
  }) = _User;
}

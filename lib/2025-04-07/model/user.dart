import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  final String id;
  final String email;
  final String password;
  final DateTime createAt;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.createAt,
  });
}
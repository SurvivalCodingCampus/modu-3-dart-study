import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class User with _$User {
  final String id;
  final String email;
  final String password;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });
}

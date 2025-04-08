// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class User with _$User {
  final String id;
  final String email;
  final String password;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });
}

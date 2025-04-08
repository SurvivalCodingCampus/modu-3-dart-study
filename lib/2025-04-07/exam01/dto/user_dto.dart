import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  final String? id;
  final String email;
  final String password;
  final String? createdAt;
  final String? errorMessage;

  const UserDto({
    this.id,
    required this.email,
    required this.password,
    this.createdAt,
    this.errorMessage,
  });
}

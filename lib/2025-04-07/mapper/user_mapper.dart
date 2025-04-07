import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? "정보 없음",
      email: email ?? "정보 없음",
      password: password ?? "정보 없음",
      createdAt: DateTime.parse(createdAt ?? '1970-01-01'),
    );
  }

  UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt.toIso8601String(),
    );
  }
}

import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';

extension UserDtoMapper on UserDto {
  User toModel() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime.now(),
    );
  }
}

extension UserModelMapper on User {
  UserDto toDto() {
    return UserDto(
      id: id,
      email: email,
      password: password,
      createdAt: createdAt.toIso8601String(),
    );
  }
}
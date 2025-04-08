import '../dto/user_dto.dart';
import '../model/user.dart';

extension UserDtoMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? 'abc@naver.com',
      password: password ?? '1234',
      createdAt:
          createdAt == null ? DateTime.now() : DateTime.parse(createdAt!),
    );
  }
}

extension UserMapper on User {
  UserDto fromUser() {
    return UserDto(
      id: id,
      email: email,
      password: password,
      createdAt: createdAt.toString(),
    );
  }
}

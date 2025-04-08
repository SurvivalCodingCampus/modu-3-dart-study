import '../dto/user_dto.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createdAt: DateTime.parse(createdAt ?? '1111-11-11'),
    );
  }

  UserDto toUserDto() {
    return UserDto(
      id: id,
      email: email,
      password: password,
      createdAt: createdAt,
    );
  }
}

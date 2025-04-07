import '../dto/user_dto.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createdAt: DateTime.parse(createdAt!),
      errorMessage: errorMessage ?? '네트워크 오류',
    );
  }
}

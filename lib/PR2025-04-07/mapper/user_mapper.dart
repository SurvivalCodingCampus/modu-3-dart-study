import 'package:modu_3_dart_study/PR2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/PR2025-04-07/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email,
      password: password,
      createdAt: DateTime.parse(createdAt),
      errorMessage: errorMessage ?? '네트워크 오류',
    );
  }
}

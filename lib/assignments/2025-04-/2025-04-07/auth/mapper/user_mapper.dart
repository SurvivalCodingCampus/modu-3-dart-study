import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime.now(),
    );
  }
}

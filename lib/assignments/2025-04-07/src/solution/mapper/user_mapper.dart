import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/user_dto.dart';

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

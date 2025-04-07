import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    if (id == null || email == null || password == null) {
      throw Exception('id, password 또는 email 필수값이 누락되었음. UserDto: $this');
    }
    return User(
      id: id!,
      email: email!,
      password: password!,
      createdAt:
          createdAt != null
              ? DateTime.parse(createdAt!)
              : DateTime.fromMicrosecondsSinceEpoch(0),
    );
  }
}

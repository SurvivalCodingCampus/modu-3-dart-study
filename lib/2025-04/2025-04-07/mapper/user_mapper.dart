import 'package:modu_3_dart_study/2025-04/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/dto/user_dto.dart';

extension UserMapper on UserDto {
  User toModel() {
    return User(
      id: id,
      email: email,
      password: password,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
    );
  }
}

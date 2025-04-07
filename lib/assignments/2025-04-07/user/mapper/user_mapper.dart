import 'package:modu_3_dart_study/assignments/2025-04-07/user/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    final ymd = createdAt.split(' ').first.split('-');
    final year = int.parse(ymd[0]);
    final month = int.parse(ymd[1]);
    final day = int.parse(ymd[2]);
    final hour = int.parse(createdAt.split(' ').last.split(':').first);
    final userCreatedAt = DateTime(year, month, day, hour);
    return User(
      id: id,
      email: email,
      password: password,
      createdAt: userCreatedAt,
    );
  }
}

import 'package:modu_3_dart_study/2025-04-07/extension/date_time_extension.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: '$id',
      email: '$email',
      password: '$password',
      createdAt:
          createdAt?.toDateTime(format: 'yyyy-MM-dd') ?? DateTime(1970, 1, 1),
    );
  }
}

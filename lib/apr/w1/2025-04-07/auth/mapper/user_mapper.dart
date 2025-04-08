import '../dto/auth_dto.dart';
import '../model/user.dart';

extension UserMapper on AuthDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createdAt: DateTime.parse(createdAt ?? '${DateTime.now()}'),
    );
  }
}

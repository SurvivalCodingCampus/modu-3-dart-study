import '../dto/user_dto.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? '',
      email: email ?? '',
      password: password ?? '',
      createAt: createAt != null && createAt != ''
          ? DateTime.tryParse(createAt!) ?? DateTime(1970, 1, 1)
          : DateTime(1970, 1, 1),
      errorMessage: errorMessage
    );
  }
}
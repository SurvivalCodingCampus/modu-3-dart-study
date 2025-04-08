import 'package:modu_3_dart_study/2025-04-07/exam01/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/model/user.dart';

extension UserMapper on UserDto {
  Result<User?, RegistrationError> toUser() {
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return Result<User, RegistrationError>.error(
        RegistrationError.invalidEmail,
      );
    }

    if (password.length < 6) {
      return Result<User, RegistrationError>.error(
        RegistrationError.weakPassword,
      );
    }

    return Result<User, RegistrationError>.success(
      User(email: email, password: password),
    );
  }
}

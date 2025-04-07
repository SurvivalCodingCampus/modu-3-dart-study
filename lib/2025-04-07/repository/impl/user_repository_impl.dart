import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/user_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enums/registration_error.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(super.dataSource, super.dto);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }
    if (password.length <= 6) {
      return Result.error(RegistrationError.weakPassword);
    }

    try {
      User user =
          (await dataSource.registerUser(
            email: email,
            password: password,
          )).toUser();

      return Result.success(user);
    } on RegistrationError {
      return Result.error(RegistrationError.networkError);
    }
  }
}

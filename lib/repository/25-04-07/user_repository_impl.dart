import 'package:modu_3_dart_study/core/25-04-07/registration_error.dart';
import 'package:modu_3_dart_study/core/25-04-07/user_result.dart';
import 'package:modu_3_dart_study/mapper/25-04-07/to_user_model.dart';
import 'package:modu_3_dart_study/model/25-04-07/user.dart';
import 'package:modu_3_dart_study/repository/25-04-07/user_repository.dart';
import '../../data_source/25-04-07/auth_remote_data_source.dart';
import '../../dto/25-04-07/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource userDataSource;
  AuthRepositoryImpl(this.userDataSource);

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool isWeakPassword(String password) {
    return password.length < 6;
  }

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!isValidEmail(email)) {
      return Result.error(RegistrationError.invalidEmail);
    } else if (isWeakPassword(password)) {
      return Result.error(RegistrationError.weakPassword);
    }
    try {
      final userDto = await userDataSource.registerUser(
        email: email,
        password: password,
      );
      if (userDto.errorMessage != null) {
        return Result.error(RegistrationError.networkError);
      }
      final user = userDto.toUserModel();
      return Result.success(user);
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}

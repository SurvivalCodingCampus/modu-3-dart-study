import 'package:modu_3_dart_study/2025-04-07/exam01/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/dto/user_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    return UserDto(email: email, password: password);
  }
}

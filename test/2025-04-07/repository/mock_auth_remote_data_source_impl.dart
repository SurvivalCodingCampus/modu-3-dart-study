import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<UserDto> registerUser({required String email, required String password, String? errorMessage}) async {
    return UserDto(
      id: email.split('@').first,
      email: email,
      password: password,
      createAt: DateTime.now().toString(),
      errorMessage: errorMessage
    );
  }
}
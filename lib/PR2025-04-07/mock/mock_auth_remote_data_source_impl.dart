import 'package:modu_3_dart_study/PR2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-07/dto/user_dto.dart';

class MockUserDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    return UserDto(
      id: '1',
      email: email,
      password: password,
      createdAt: '2025-04-07',
      errorMessage: 'error',
    );
  }
}

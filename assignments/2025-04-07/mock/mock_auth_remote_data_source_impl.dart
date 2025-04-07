import '../data_source/auth_remote_data_source.dart';
import '../dto/user_dto.dart';

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

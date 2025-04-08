import '../dto/user_dto.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    return UserDto(
      id: '1',
      email: email,
      password: password,
      createdAt: DateTime.now().toString(),
      errorMessage: '',
    );
  }
}

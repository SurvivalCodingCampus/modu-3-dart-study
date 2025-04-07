import '../dto/user_dto.dart';
import 'auth_remote_data_source.dart';

class MockAuthRemoteDataSourceImpl implements MockAuthRemoteDataSource {
  @override
  Future<UserDto?> registerUser({
    required String email,
    required String password,
  }) async {
    return null;
  }
}

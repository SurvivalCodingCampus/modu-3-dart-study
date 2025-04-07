import '../dto/user_dto.dart';
import 'auth_retmote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRetmoteDataSource {
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    return UserDto(email: email, password: password);
  }
}

import '../dto/user_dto.dart';

abstract interface class AuthRetmoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}

import '../../dto/25-04-07/user_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}

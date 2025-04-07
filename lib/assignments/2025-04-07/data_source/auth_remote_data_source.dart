import '../dto/user_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });

  Future<List<UserDto>> getUsers();
}

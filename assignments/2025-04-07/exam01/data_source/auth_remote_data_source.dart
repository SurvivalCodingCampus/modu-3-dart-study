import '../dto/user_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}

abstract interface class MockAuthRemoteDataSource {
  Future<UserDto?> registerUser({
    required String email,
    required String password,
  });
}

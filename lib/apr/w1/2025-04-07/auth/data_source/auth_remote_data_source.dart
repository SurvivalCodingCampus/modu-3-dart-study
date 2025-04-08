import '../dto/auth_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthDto> registerUser({
    required String email,
    required String password,
  });
}

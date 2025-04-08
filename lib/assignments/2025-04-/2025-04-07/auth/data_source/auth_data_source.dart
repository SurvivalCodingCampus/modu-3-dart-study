import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/dto/user_dto.dart';

abstract interface class AuthDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}
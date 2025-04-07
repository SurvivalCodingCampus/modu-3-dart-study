import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/user_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}

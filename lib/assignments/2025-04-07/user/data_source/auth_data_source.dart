import 'package:modu_3_dart_study/assignments/2025-04-07/user/dto/user_dto.dart';

abstract interface class AuthDataSource {
  Future<UserDto> registerUser(Map<String,dynamic> user);
}

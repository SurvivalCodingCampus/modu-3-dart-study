import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

abstract class UserDataSource {
  Future<UserDto> registerUser(UserDto userDto);
}
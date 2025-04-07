import 'package:modu_3_dart_study/assignments/2025-04-05/dto/user_dto.dart';

abstract interface class AuthDataSource {
  Future<String> registerUser(Map<String,dynamic> user);
}

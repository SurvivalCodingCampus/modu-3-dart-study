import 'dart:convert';
import 'package:modu_3_dart_study/dto/25-04-07/user_dto.dart';
import 'auth_remote_data_source.dart';

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  final String? errorMessage;
  MockAuthRemoteDataSource({this.errorMessage});
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final jsonData = '''
   {"id": "adam",
   "email": "$email",
   "password": "$password",
   "createAt": "2023-04-07",
   "errorMessage": "${errorMessage ?? null}",
  }
  ''';
    final Map<String, dynamic> data = json.decode(jsonData);
    return UserDto.fromJson(data);
  }
}

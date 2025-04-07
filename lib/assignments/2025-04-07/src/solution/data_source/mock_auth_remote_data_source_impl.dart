import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final mockData = '''
  [
    {
      "id": "test1",
      "email": "test1@example.com",
      "password": "12345678",
      "createdAt": "2025-04-01T12:00:00Z",
      "errorMessage": "address is exist"
    },
    {
      "id": "test2",
      "email": "test2@example.com",
      "password": "12345678",
      "createdAt": "2025-04-02T12:00:00Z",
      "errorMessage": "address is exist"
    },
    {
      "id": "test3",
      "email": "test3@example.com",
      "password": "12345678",
      "createdAt": "2025-04-03T12:00:00Z",
      "errorMessage": "address is exist"
    }
  ]

  ''';
  // final http.Client? _client;

  // AuthRemoteDataSourceImpl({http.Client? client}) : _client = client;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    // if (_client == null) {
    //   return UserDto(
    //     id: '0',
    //     email: email,
    //     password: password,
    //     createdAt: DateTime.now().toIso8601String(),
    //   );
    // }

    // final response = await _client.post(
    //   Uri.parse('https://heojunho.com'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({'email': email, 'password': password}),
    // );
    // if (response.statusCode == 200) {
    //   final respData = jsonDecode(response.body);
    //   return UserDto.fromJson(respData);
    // } else {
    //   throw Exception('Network error');
    // }

    final users = await getUsers();

    bool isExist = users.any((e) => e.email == email);

    if (isExist) {
      return UserDto(
        id: 'abcd1234',
        email: email,
        password: password,
        createdAt: DateTime.now().toIso8601String(),
        errorMessage: 'address is exist',
      );
    }

    return UserDto(
      id: 'abcd1234',
      email: email,
      password: password,
      createdAt: DateTime.now().toIso8601String(),
      errorMessage: null,
    );
  }

  @override
  Future<List<UserDto>> getUsers() async {
    final response = await jsonDecode(mockData) as List;
    final datas = List<Map<String, dynamic>>.from(response);
    return datas.map((e) => UserDto.fromJson(e)).toList();
  }
}

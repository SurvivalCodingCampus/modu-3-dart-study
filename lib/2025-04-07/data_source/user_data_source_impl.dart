import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-07/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  final String jsonPath;

  UserDataSourceImpl({required this.jsonPath});

  Future<List<UserDto>> fetchUsers() async {
    final file = File(jsonPath);

    if (!await file.exists()) {
      throw Exception('User JSON file not found');
    }

    final jsonString = await file.readAsString();
    final jsonData = json.decode(jsonString);

    if (jsonData is! List) {
      throw Exception('Invalid user data format');
    }

    return jsonData.map((e) => UserDto.fromJson(e)).toList();
  }

  @override
  Future<UserDto> registerUser(UserDto userDto) async {
    return UserDto(
      id: 'generated_id_123',
      email: userDto.email,
      password: userDto.password,
      createdAt: DateTime.now().toIso8601String(),
    );
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/core/user_file_util.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;
  MockAuthRemoteDataSourceImpl(this._client);

  final String _url = 'https://myapp.com/register';
  final UserFileUtil _userFileUtil = UserFileUtil();

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url || request.method == 'POST') {
        final body = jsonDecode(request.body);
        final email = body['email'];
        final password = body['password'];

        if (email == null ||
            email.toString().trim().isEmpty ||
            password == null ||
            password.toString().trim().isEmpty) {
          return http.Response(
            '누락된 데이터가 있습니다.',
            404,
            headers: {"content-type": "text/plain; charset=utf-8"},
          );
        }

        if (email == 'network@error.com' && password == 'error123') {
          return http.Response(
            '네트워크 에러',
            505,
            headers: {"content-type": "application/json; charset=utf-8"},
          );
        }

        final users = await getUsers();

        UserDto userDto = UserDto(
          id: 'users1',
          email: email,
          password: password,
          createdAt: DateTime.now().toIso8601String(),
          errorMessage: null,
        );

        for (final user in users) {
          if (user.email == email) {
            userDto = userDto.copyWith(errorMessage: '동일한 아이디가 존재합니다.');
            return http.Response(
              jsonEncode(userDto.toJson()),
              402,
              headers: {"content-type": "application/json; charset=utf-8"},
            );
          }
        }

        users.add(userDto);
        await _userFileUtil.writeJsonFile(
          users.map((e) => e.toJson()).toList(),
        );

        return http.Response(
          jsonEncode(userDto.toJson()),
          200,
          headers: {'Content-Type': 'application/json'},
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.post(
      Uri.parse(_url),
      headers: {"content-type": "application/json; charset=utf-8"},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data);
    } else {
      throw Exception(utf8.decode(response.bodyBytes));
    }
  }

  @override
  Future<List<UserDto>> getUsers() async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url) {
        return http.Response(
          jsonEncode(await _userFileUtil.readJsonData()),
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw HttpException('Failed to load data');
    }
  }
}

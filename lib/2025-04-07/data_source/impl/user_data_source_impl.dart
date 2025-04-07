import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-07/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/enums/registration_error.dart';

class UserDataSourceImpl extends UserDataSource {
  static const String userApi = '';

  UserDataSourceImpl(UserDto dto, {super.client, String? url})
    : super(url ?? userApi, dto);

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final httpData = await client.post(
      Uri.parse(httpUrl),
      body: jsonEncode({email: email, password: password}),
      encoding: Encoding.getByName('utf-8'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    if (httpData.statusCode == 200) {
      final httpBody = httpData.body;
      final Map<String, dynamic> httpJson = jsonDecode(httpBody);

      return dto.fromJson(httpJson);
    }
    throw RegistrationError.networkError;
  }
}

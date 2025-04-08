import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

import 'auth_remote_data_source.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const String networkErrorEmail = 'networkerror@example.com';

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    if (email == networkErrorEmail) {
      throw Exception('네트워크 오류 발생');
    }

    return UserDto(
      id: email,
      email: email,
      password: password,
      createdAt: DateTime.now().toIso8601String(), // 현재 시간으로 생성일자 설정
    );
  }
}

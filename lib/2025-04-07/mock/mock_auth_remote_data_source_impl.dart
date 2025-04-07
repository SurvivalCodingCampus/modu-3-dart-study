import 'dart:async';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/user_data_source.dart';

class MockAuthRemoteDataSourceImpl implements UserDataSource {
  @override
  Future<UserDto> registerUser(UserDto userDto) async {
    await Future.delayed(Duration(milliseconds: 300)); // Mock delay

    // 이메일 정규식 체크
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(userDto.email ?? '')) {
      return UserDto(errorMessage: 'invalid_email');
    }

    // 비밀번호 길이 체크
    if ((userDto.password?.length ?? 0) <= 6) {
      return UserDto(errorMessage: 'weak_password');
    }

    // 예외 처리 시뮬레이션이 아니라면 정상 등록
    return UserDto(
      id: 'mock_user_123',
      email: userDto.email,
      password: userDto.password,
      createdAt: DateTime.now().toIso8601String(),
    );
  }
}
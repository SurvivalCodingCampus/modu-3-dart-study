import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final UserDto _returnUserDto;

  MockAuthRemoteDataSourceImpl({required UserDto returnUserDto})
    : _returnUserDto = returnUserDto;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    // Mock 데이터 반환
    _returnUserDto.email = email;
    _returnUserDto.password = password;
    return Future.value(_returnUserDto);
  }
}

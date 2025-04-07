import 'package:modu_3_dart_study/2025-04-07/data/datasource/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    //다양한 에러 상황 발생
    if (email == 'error@example.com') {
      throw Exception('네트워크 에러 발생');
    }

    return UserDto(
      id: '1',
      email: email,
      password: password,
      createdAt:  DateTime.now().toIso8601String(),
      errorMessage: null,
      //errorMessage: '이미 등록된 메일입니다.',  //에러 발생 유도하고 싶으면 메세지 넣으면 됨.
    );
  }
}

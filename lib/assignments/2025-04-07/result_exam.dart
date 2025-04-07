import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/repository/auth_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/util/registration_error_enum.dart';

void main() async {
  final mockClient = MockClient((request) async {
    print("mockClient 진입");
    return http.Response('success', 200);
  });

  final AuthDataSource mockAuthDataSource = MockAuthRemoteDataSourceImpl(
    client: mockClient,
    url: "https://test.com",
  );
  final AuthRepository authRepository = AuthRepositoryImpl(
    dataSource: mockAuthDataSource,
  );

  final result = await authRepository.registerUser(
    email: 'test@example.com',
    password: '12345678',
  );
  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case (RegistrationError.invalidEmail):
          print("유효하지 않은 이메일 주소입니다.");
        case (RegistrationError.weakPassword):
          print("비밀번호가 너무 약합니다. 8자 이상의 복잡한 비밀번호를 사용해주세요.");
        case (RegistrationError.networkError):
          print("네트워크 오류가 발생했습니다. 인터넷 연결을 확인해주세요.");
      }
  }
}

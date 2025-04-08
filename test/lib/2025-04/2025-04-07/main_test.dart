import 'package:modu_3_dart_study/2025-04/2025-04-07/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/user.dart' show User;
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/auth_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04/mock/mock_client.dart'
    show mockClient;
import 'package:modu_3_dart_study/core/result.dart';

void main() async {
  Map<String, dynamic> mockData = {
    "id": "1",
    "email": "test@test.com",
    "password": "password",
    "createdAt": "2025-04-07T14:00:00Z",
  };

  final client = mockClient(true, mockData);
  final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(client);
  final AuthRepository repository = AuthRepositoryImpl(dataSource);

  final result = await repository.registerUser(
    email: mockData['email'],
    password: mockData['password'],
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.value.email}');
    case Failure<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:
          print('이메일이 이미 존재합니다.');
        case RegistrationError.weakPassword:
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
      }
  }
}

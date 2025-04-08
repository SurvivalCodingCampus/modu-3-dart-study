import 'package:modu_3_dart_study/core/25-04-07/registration_error.dart';
import 'package:modu_3_dart_study/core/25-04-07/user_result.dart';
import 'package:modu_3_dart_study/data_source/25-04-07/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/data_source/25-04-07/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/model/25-04-07/user.dart';
import 'package:modu_3_dart_study/repository/25-04-07/user_repository.dart';
import 'package:modu_3_dart_study/repository/25-04-07/user_repository_impl.dart';

void main() async {
  final AuthRemoteDataSource authRemoteDataSource = MockAuthRemoteDataSource();
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteDataSource,
  );
  final result = await authRepository.registerUser(
    email: 'test@example.com',
    password: '12678',
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 합니다..');
        case RegistrationError.networkError:
          print('네트워크 에러가 발생했습니다.');
      }
  }
}

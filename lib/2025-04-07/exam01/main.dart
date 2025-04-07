import 'package:modu_3_dart_study/2025-04-07/exam01/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/data_source/auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/repository/auth_repository_impl.dart';

import 'core/registration_error.dart';
import 'core/result.dart';
import 'model/user.dart';

void main() async {
  final AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSourceImpl();
  final AuthRepository authRepository = AuthRepositoryImpl(
    dataSource: _authRemoteDataSource,
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
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 합니다.');
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
      }
  }
}

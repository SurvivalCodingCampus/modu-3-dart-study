import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';

import '../2025-04-07/model/user.dart';
import 'core/result.dart';

void main() async {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  final result = await _authRepository.registerUser(
    email: 'test@example.com',
    password: '12345678',
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다');
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 한다.');
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
      }
  }
}

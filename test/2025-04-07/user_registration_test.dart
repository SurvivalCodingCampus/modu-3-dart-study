import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/domain/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/domain/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/domain/repository/auth_repository_impl.dart';

void main() async {
  final AuthRepository authRepository = AuthRepositoryImpl();

  final result = await authRepository.registerUser(
    email: 'error@example.com',     //네트워크 에러 발생 error@example.com
    password: '1234567',
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:       //테스트 확인: test**@example.com
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.weakPassword:       //테스트 확인: 123
          print('비밀번호는 6자 이상이어야 합니다.');
        case RegistrationError.emailAlreadyInUse:   // mock에서 UserDto 에 errorMessage 에 설정.
          print('이미 등록되어 있는 이메일입니다.');
        case RegistrationError.networkError:       //테스트 확인: error@example.com
          print('네트워크 오류가 발생했습니다.');
      }
  }
}
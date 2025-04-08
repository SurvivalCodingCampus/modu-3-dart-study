import 'core/enum/registration_error.dart';
import 'core/result.dart';
import 'data_source/auth_remote_data_source_impl.dart';
import 'model/user.dart';
import 'repository/auth_repository.dart';
import 'repository/auth_repository_impl.dart';

void main() async {
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRetmoteDataSource: AuthRemoteDataSourceImpl(),
  );

  final result = await authRepository.registerUser(
    email: 'hihi1234@example.com',
    password: '123456789',
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공 : ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invaildEmail:
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 합니다.');
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
      }
  }
}

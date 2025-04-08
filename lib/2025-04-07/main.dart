import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/error/registration_error.dart';

import 'core/result.dart';
import 'model/user.dart';
import 'repository/auth_repository_impl.dart';
import 'repository/auth_repository.dart';

void main() async {
  final AuthRemoteDataSource authRemoteDataSource =
      MockAuthRemoteDataSourceImpl(
        returnUserDto: UserDto(
          id: "1",
          email: "test@example.com",
          password: "12345678",
          createdAt: '2022-03-01',
        ),
      );
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteDataSource: authRemoteDataSource,
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
        case InvalidEmailError():
        case WeakPasswordError():
          print(result.error.errorMessage);
        case NetworkError(errorMessage: final String message):
          print(message);
        case NetworkError():
          print('네트워크 오류가 발생했습니다.');
      }
  }
}

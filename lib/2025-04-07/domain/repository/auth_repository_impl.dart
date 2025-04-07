import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data/datasource/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data/datasource/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/domain/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource = MockAuthRemoteDataSourceImpl();

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    //이메일 정규식 체크
    if (!isValidEmail(email)) {
      return const Result.error(RegistrationError.invalidEmail);
    }

    //password 길이 체크
    if (password.length < 6) {
      return const Result.error(RegistrationError.weakPassword);
    }

    try {
      final dto = await remoteDataSource.registerUser(
        email: email,
        password: password,
      );

      if (dto.errorMessage != null) {
        return const Result.error(RegistrationError.emailAlreadyInUse);
      }

    } catch (_) {
      //그 외 에러는 전부 네트워크 에러로 간주 하고 직접 처리
      return const Result.error(RegistrationError.networkError);
    }

    //여기 까지 오기 전에 return 되는데... 코드 개선 필요
    throw Exception ('문법에러 처리위해 추가함');
  }

  // 정규식 TIL 정리 필요
  bool isValidEmail(String email) {
    final emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegexp.hasMatch(email);
  }
}

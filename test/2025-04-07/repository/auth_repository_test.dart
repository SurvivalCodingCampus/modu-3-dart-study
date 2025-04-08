import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/error/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('AuthRepository 테스트', () {

    AuthRemoteDataSource authRemoteDataSource = MockAuthRemoteDataSourceImpl(
      returnUserDto: UserDto(
        id: "100",
        email: "test@example.com",
        password: "12345678",
        createdAt: '2022-03-01',
      ),
    );

    AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );

    test(
      '유저 등록 시 유효한 email 이어야 하고 아니면 RegistrationError.implements를 Result.error로 반환한다.',
      () async {
        final result = await authRepository.registerUser(
          email: 'test@example',
          password: '12345678',
        );

        expect(
          result,
          Result<User, RegistrationError>.error(
            RegistrationError.invalidEmail(),
          ),
        );
      },
    );

    test(
      '유저 등록 시 약하지 않은 password 이어야 하고 아니면 RegistrationError.weakPassword를 Result.error로 반환한다.',
      () async {
        final result = await authRepository.registerUser(
          email: 'test@example.com',
          password: '123456',
        );

        expect(
          result,
          Result<User, RegistrationError>.error(
            RegistrationError.weakPassword(),
          ),
        );
      },
    );

    test('유저 등록 시 email, password가 올바르면 정상적으로 user를 반환해야 한다.', () async {
      final beforeUser = User(
        id: '1',
        email: 'example@example.com',
        password: 'qwer1234',
        createdAt: DateTime.now(),
      );

      final result = await authRepository.registerUser(
        email: beforeUser.email,
        password: beforeUser.password,
      );

      switch (result) {
        case Success(data: final afterUser):
          expect(beforeUser.email, afterUser.email);
          expect(beforeUser.password, afterUser.password);
        case Error<User, RegistrationError>():
          fail('정상적으로 유저가 만들어지지 않았습니다.');
      }
    });

    test('유저 등록 시 errorMessage가 있으면 message를 반환해야 한다.', () async {
      const customErrorMessage = '예상치 못한 에러 발생!!';
      final userDto = UserDto(
        id: '1',
        email: 'example@example.com',
        password: 'qwer1234',
        createdAt: '2022-03-01',
        message: customErrorMessage,
      );
      final user = userDto.toUser();

      authRemoteDataSource = MockAuthRemoteDataSourceImpl(
        returnUserDto: userDto,
      );
      authRepository = AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource);

      final result = await authRepository.registerUser(
        email: user.email,
        password: user.password,
      );

      expect(
        result,
        Result<User, RegistrationError>.error(
          RegistrationError.networkError(message: customErrorMessage),
        ),
      );
    });
  });
}

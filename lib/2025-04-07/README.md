# 과제 - 유저 등록 시나리오

- 이 코드가 동작하도록 코드를 작성

```dart
void main() async {
  final AuthRepository authRepository = AuthRepositoryImpl();

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
```

## 과제 1-1 - DTO 작성

```dart
abstract interface class AuthRemoteDataSource {
  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}
```

- UserDto
    - String id
    - String email
    - String password
    - String createdAt

## 과제 1-2 - Model 클래스, mapper 작성

- User
    - String id
    - String email
    - String password
    - DateTime createdAt

> Mapper는 Dto → Model, Model → Dto 를 만든다

## 과제 1-3 - Result 클래스, AuthRepositoryImpl

```dart
abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
```

```dart
enum RegistrationError {
  invalidEmail,
  weakPassword,
  networkError,
}
```

1. 에러  
   a. 이메일이 유효하지 않은지 정규식을 사용해서 판단  
   b. 6자리 이하의 패스워드는 약한 패스워드  
   c. 예외 발생시 네트워크 에러

2. 성공  
   a. 정상 등록되면 User 객체를 성공 객체로 반환

## 과제 1-4 - MockAuthRemoteDataSourceImpl 작성, Test 코드 작성

1. 에러  
   a. 이메일이 유효하지 않은지 정규식을 사용해서 판단  
   b. 6자리 이하의 패스워드는 약한 패스워드  
   c. 예외 발생시 네트워크 에러

2. 성공  
   a. 정상 등록되면 User 객체를 성공 객체로 반환
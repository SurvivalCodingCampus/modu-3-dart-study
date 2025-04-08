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

---


다음은 요청한 이미지 내용을 마크다운 형식으로 변환한 것입니다:

---

## 과제 2. 이미지 검색 기능 작성

- **DataSource** - [https://pixabay.com/](https://pixabay.com/)  
  가입하여 Image Search API 사용법을 터득할 것. PostMan 등을 활용하여 결과 확인
  49670331-b0e47e0723424be62ba8dac16
- **다음 내용을 작성하기**
    - **Photo 모델 클래스** (frozen 사용)
        - tags
        - imageUrl

    - **DTO** (json to dart 활용), mapper 작성

    - **PhotoRepository**
        - `Future<Result<List<Photo>>> getPhotos(String query)`
        - 예외 처리에 `Result` 패턴 활용
            - try - catch 로 에러 검출시 "알 수 없는 네트워크 에러" 메시지를 리턴
            - ‘바보’ 로 검색하면 "비속어를 사용할 수 없습니다" 메시지를 리턴
        - **PhotoDataSource** 의 Mock 객체 또는 MockClient를 활용하여 `PhotoRepository`를 테스트할 것
        - 테스트시 여러개의 Mock 객체 또는 MockClient를 활용할 것  
          (예: 항상 네트워크 에러를 발생시키는 데이터 소스, 정상 동작하는 데이터 소스)

---
## Variables  and Constants



## 네이밍 컨벤션



### 변수 & 함수 → CamelCase

```dart
int itemCount = 10;
String getUserName() { ... }
```

### 클래스 & enum → PascalCase

```dart
class UserProfile { ... }
enum UserType { admin, guest, member }
```

### 상수 (const, final) → CamelCase (전역 상수는 UPPER_SNAKE_CASE 허용)

```dart
const int maxRetries = 3;
final String appVersion = "1.0.0";
const double PI = 3.1415; // 전역 상수일 경우
```

### 프라이빗 변수 & 함수 → CamelCase (앞에 _ 추가)

```dart
class User {
  String _privateField = "secret";
  void _privateMethod() { ... }
}
```

### 파일 및 디렉토리 → snake_case.dart

```dart
// 파일 이름
user_profile.dart  
main_screen.dart  

// 디렉토리 이름
models/
controllers/
```





### Dynamic VS Object

#### Dynamic

- `dynamic`은 완전한 타입 검사를 우회하는 특별한 타입
- 메서드나 속성의 존재를 컴파일타임에 확인하지 않음.

#### Object

- `Object`는 Dart의 모든 클래스의 최상위 타입
- 컴파일 타임에 타입 체크가 이루어짐





#### 프로퍼티

- p는 프로퍼티, f는 필드.
- 일반적으로 property는 getter, setter를 얘기함

```dart
String _name; // property, field, member
int get name => _name // property
```


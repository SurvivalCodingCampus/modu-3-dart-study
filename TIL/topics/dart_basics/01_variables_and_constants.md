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





### final, const



| **구분**                         | final                                                   | const                                    |
| -------------------------------- | ------------------------------------------------------- | ---------------------------------------- |
| 값 변경 여부                     | 한 번 할당하면 변경 불가                                | 한 번 할당하면 변경 불가                 |
| 컴파일 타임 상수 여부            | ❌ (런타임에서 결정됨)                                   | ✅ (컴파일 타임에 결정됨)                 |
| 인스턴스별 새로운 객체 생성 여부 | ✅ (각 인스턴스마다 새로운 객체)                         | ❌ (모든 인스턴스가 동일한 객체)          |
| 선언 가능 위치                   | 클래스 필드, 지역 변수, 전역 변수 등 어디서나 사용 가능 | 반드시 const가 될 수 있는 값만 저장 가능 |
| 메모리                           | 사용할 때 메모리에 자리잡음                             | 미리 메모리상에 자리잡음                 |





#### 예제 코드 비교

```dart
void main() {
  final DateTime now = DateTime.now();  // ✅ 가능 (런타임에서 결정됨)
  // const DateTime now2 = DateTime.now(); // ❌ 오류 (컴파일 타임에 값이 결정되지 않음)

  const int maxLimit = 100; // ✅ 가능 (컴파일 타임 상수)
  
  final list1 = [1, 2, 3];  // ✅ 리스트 자체는 변경 불가하지만 내부 요소 변경 가능
  list1[0] = 10;            // ✅ 가능 (리스트 내부 요소 변경)

  const list2 = [1, 2, 3];  // ✅ 리스트 자체도 불변
  // list2[0] = 10;          // ❌ 오류 (내부 요소 변경 불가능)
}
```



#### final과 const를 언제 사용할까?

1. final 사용 시점

- 값이 한 번만 할당되지만, 런타임에서 결정되는 경우
- 클래스 필드에서 사용 (const는 인스턴스 변수로 사용할 수 없음)

```dart
class User {
  final String name;
  User(this.name);
}
```

- final이므로 한 번 할당된 후 변경 불가능.



2. const 사용 시점

- **컴파일 타임에 결정될 수 있는 값**
- **불변 객체가 필요할 때** (const를 사용하면 인스턴스를 공유하여 메모리 절약 가능)

```dart
class Config {
  static const String apiUrl = "https://api.example.com";
}
```

- apiUrl은 변하지 않는 상수이므로 const 사용.



#### final vs const 인스턴스 차이

```dart
void main() {
  final list1 = [1, 2, 3];
  const list2 = [1, 2, 3];

  print(identical(list1, list2)); // false (list1은 런타임에 생성됨)

  const list3 = [1, 2, 3];
  print(identical(list2, list3)); // true (const는 동일한 인스턴스를 공유)
}
```

- final은 새로운 객체가 생성되지만, const는 동일한 객체를 재사용.





**✅ 결론**

| **사용 추천**                                | final       | const       |
| -------------------------------------------- | ----------- | ----------- |
| **런타임에 값이 결정됨**                     | ✅ 사용 가능 | ❌ 사용 불가 |
| **값을 한 번만 할당하고 변경 불가능해야 함** | ✅ 사용 가능 | ✅ 사용 가능 |
| **컴파일 타임 상수로 정의 가능**             | ❌ 사용 불가 | ✅ 사용 가능 |
| **클래스 인스턴스 필드에 사용**              | ✅ 가능      | ❌ 불가능    |
| **객체를 재사용하고 메모리 절약**            | ❌ 불가능    | ✅ 가능      |







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


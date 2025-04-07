

# Package모음





## derry

derry는 package.json의 scripts와 유사하게, 자주 사용하는 긴 명령어를 짧은 별칭으로 실행할 수 있게 해주는 도구

- 👍 복잡한 명령어를 짧은 별칭으로 관리하여 개발 워크플로우를 간소화
- 👎 추가 도구 의존성이 생기며 프로젝트 설정 단계가 늘어남

### 사용 예시

#### **pubspec.yaml에 scripts 정의:**

```yaml
name: my_flutter_app

# derry scripts 정의
scripts:
  # 기본 명령어
  build: flutter pub run build_runner build --delete-conflicting-outputs
  watch: flutter pub run build_runner watch
  
  # 여러 명령어 실행
  setup:
    - flutter clean
    - flutter pub get
    - flutter pub run build_runner build
  
  # 중첩 스크립트
  test:
    unit: flutter test test/unit
    widget: flutter test test/widget
    all: flutter test
    
  # 복잡한 플랫폼별 명령어
  release:
    android: flutter build appbundle --release
    ios: flutter build ios --release
```

#### **명령어 실행:**

```bash
# 설치
$ dart pub global activate derry

# 명령어 실행 예시
$ derry build        # flutter pub run build_runner build --delete-conflicting-outputs 실행
$ derry setup        # setup에 정의된 모든 명령어 순차적으로 실행
$ derry test:unit    # 중첩 스크립트 실행
$ derry release:ios  # iOS 릴리스 빌드 실행
```







## freezed

- 모델을 손쉽게 정의 도와준다.

- 👍 불변 데이터 클래스, 패턴 매칭, JSON 직렬화를 한 번에 제공하여 코드량 감소

  👎 코드 생성 빌드 단계가 필요하고 오류 메시지가 복잡할 수 있음

### 기본 활용 예시

```dart
// freezed 및 json_serializable 어노테이션 임포트
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

// 자동 생성될 코드 파일 선언
part 'photo.freezed.dart';
part 'photo.g.dart';

// freezed 어노테이션으로 불변 데이터 클래스 정의
@freezed
class Photo with _$Photo {
  // 팩토리 생성자 - 기본 불변 클래스 정의
  factory Photo({
    required int id,
    required String title,
    String? url,
    @JsonKey(name: 'created_at') required String createdAt,
    @Default([]) List<String> tags,
  }) = _Photo;

  // JSON 파싱을 위한 팩토리 메서드 (자동 생성 코드 사용)
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
```





## json_serializable

- 👍 자동 JSON 파싱 코드 생성으로 반복 작업 제거 및 타입 안전성 확보
- 👎 코드 생성 단계가 필요하며 복잡한 중첩 구조에서 설정이 까다로울 수 있음

####   @JsonKey

```dart
import 'package:json_annotation/json_annotation.dart';

// 자동 생성될 코드를 연결하는 부분
part 'photo_dto.g.dart'; // 파일명에 맞게 설정해야 함

// JSON 직렬화를 위한 어노테이션
@JsonSerializable()
class PhotoDto {
  // 문자열이나 숫자 형태의 ID를 적절히 변환
  @JsonKey(fromJson: _fromJson)
  num? id;
  String? title;
  String? url;
  // JSON의 snake_case를 Dart의 camelCase로 매핑
  @JsonKey(name: 'created_at')
  String? createdAt;
  
  // 생성자
  PhotoDto({this.id, this.title, this.url, this.createdAt});
  
  // JSON → 객체 변환 (자동 생성 코드 사용)
  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);
  
  // 객체 → JSON 변환 (자동 생성 코드 사용)
  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
  
  // 다양한 형식의 ID 값을 처리하는 커스텀 변환 함수
  static num? _fromJson(dynamic value) {
    if (value == null) return null;
    if (value is String) return num.tryParse(value);
    if (value is num) return value;
    return null;
  }
}
```



## Mockito

- 👍 의존성을 쉽게 모킹하여 격리된 단위 테스트 작성 가능
- 👎 복잡한 상호작용 검증 시 문법이 장황해지고 코드 생성에 의존적임

### 기본 검증 패턴

```dart
verifyNever(mockDataSource.fetchPhotos());        // 아직 호출되지 않았음을 확인
await repository.getPhotos();                      // 테스트할 메서드 호출
verify(mockDataSource.fetchPhotos()).called(1);    // 1번 호출되었는지 확인
```



### 예외 처리 테스트 패턴

```dart
// 모의 객체 설정
when(mockDataSource.path).thenReturn(path);                    // 속성 반환값 설정
when(mockDataSource.fetchPhotos()).thenThrow(pathNotFoundException);  // 예외 발생 설정

// 예외가 올바르게 발생하는지 테스트
expect(
  () async => await repository.getPhotos(),
  throwsA(isA<PathNotFoundException>()),
);
```



### Capture 기법

```dart
// Captor 객체 생성
final argCaptor = ArgumentCaptor<User>();

// 테스트할 함수 호출
userService.createUser("test@example.com", "password123");

// capture()를 사용하여 전달된, 인자 값 포착
verify(mockUserRepository.saveUser(argCaptor.capture()));

// 포착된 인자 값 검증
User capturedUser = argCaptor.value;
expect(capturedUser.email, equals("test@example.com"));
expect(capturedUser.passwordHash, isNot(equals("password123")));
```




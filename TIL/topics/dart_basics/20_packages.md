

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

- JsonSerializable 라이브러리는 fromJson(), toJson() 을 자동으로 생성해 주고
- 필드명을 바꿀 수 있는 것 외에도 DTO, Model 을 하나로 합칠 수 있는 여러 기능을 제공한다.

- 👍 자동 JSON 파싱 코드 생성으로 반복 작업 제거 및 타입 안전성 확보
- 👎 코드 생성 단계가 필요하며 복잡한 중첩 구조에서 설정이 까다로울 수 있음



#### @JsonSerializable(explicitToJson: true)

```dart
// explicitToJson: true 옵션은 중첩된 객체가 있을 때 toJson 메서드를 명시적으로 호출하도록 합니다
@JsonSerializable(explicitToJson: true)
```





#### JSON Serialization 필드 값 변경 방법

```dart
import 'package:json_annotation/json_annotation.dart';

part 'store_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class Mask {
  @JsonKey(name: 'addr')
  final String address;
  
  @JsonKey(name: 'lat')
  final double latitude;
  
  @JsonKey(name: 'lng')
  final double longitude;
  
  final String name;
  
  @JsonKey(name: 'remain_stat')
  final String remainStatus;
  
  const Mask({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.remainStatus,
  });
  
  factory Mask.fromJson(Map<String, dynamic> json) => _$MaskFromJson(json);
  
  Map<String, dynamic> toJson() => _$MaskToJson(this);
}
```









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





## squlite



SQLite는 Flutter 앱에서 로컬 데이터베이스로 널리 사용되는 솔루션

### Database 관련

1. **openDatabase**

   ```dart
   await dbFactory.openDatabase(path, options: OpenDatabaseOptions(...))
   ```

   - 데이터베이스 파일을 열거나 생성하는 메소드
   - 옵션을 통해 버전, 생성/업그레이드 콜백 등 지정 가능

2. **getDatabasesPath**

   ```dart
   final dbPath = await dbFactory.getDatabasesPath();
   ```

   - 앱의 데이터베이스 파일들이 저장되는 기본 디렉토리 경로를 반환

3. **OpenDatabaseOptions**

   - `version`: 데이터베이스 스키마 버전 (마이그레이션 관리용)
   - `onCreate`: 데이터베이스 최초 생성 시 호출되는 콜백
   - `onUpgrade`: 버전이 증가할 때 호출되는 콜백 (마이그레이션)
   - `onDowngrade`: 버전이 감소할 때 호출되는 콜백

4. **인메모리 데이터베이스**

   ```dart
   ':memory:'
   ```

   - 파일로 저장하지 않고 메모리에만 데이터베이스 생성
   - 주로 테스트용으로 사용 (앱 종료 시 데이터 소멸)

### 데이터 조작 메소드

1. **execute**

   ```dart
   await db.execute('CREATE TABLE $quoteTable(...)');
   ```

   - 직접 SQL 쿼리 실행 (주로 DDL문에 사용)
   - 테이블 생성, 인덱스 생성 등에 활용

2. **insert**

   ```dart
   await db.insert(tableName, dataMap, conflictAlgorithm: ConflictAlgorithm.replace);
   ```

   - 테이블에 새 레코드 삽입
   - 데이터는 Map<String, dynamic> 형태로 전달
   - 충돌 알고리즘으로 중복 처리 방식 지정
   - 성공 시 삽입된 행의 rowid 반환

3. **update**

   ```dart
   await db.update(
     tableName, 
     dataMap,
     where: 'id = ?',
     whereArgs: [id],
   );
   ```

   - 조건에 맞는 레코드 수정
   - where과 whereArgs로 SQL 인젝션 방지
   - 영향받은 행 수 반환

4. **query**

   ```dart
   final maps = await db.query(
     tableName,
     where: 'id = ? AND language = ?',
     whereArgs: [id, languageCode],
     limit: 1,
   );
   ```

   - 테이블에서 데이터 조회
   - 결과는 List<Map<String, dynamic>> 형태로 반환
   - 다양한 옵션:
     - `columns`: 조회할 열 지정
     - `where` & `whereArgs`: 조건절
     - `orderBy`: 정렬
     - `limit`: 결과 개수 제한
     - `offset`: 결과 시작 위치

5. **rawQuery**

   ```dart
   final result = await db.rawQuery(
     'SELECT COUNT(*) as count FROM $tableName WHERE is_previously_shown = 0 AND language = ?',
     [languageCode],
   );
   ```

   - 직접 SQL 쿼리로 데이터 조회
   - 복잡한 쿼리나 집계함수 사용 시 유용

6. **delete**

   ```dart
   await db.delete(
     tableName, 
     where: 'id = ?', 
     whereArgs: [id]
   );
   ```

   - 조건에 맞는 레코드 삭제
   - 영향받은 행 수 반환

7. **batch**

   ```dart
   final batch = db.batch();
   // 여러 작업 추가
   batch.insert(...);
   batch.update(...);
   final results = await batch.commit();
   ```

   - 여러 작업을 한 번에 실행하는 배치 처리
   - 성능 최적화 (특히 대량 데이터 처리 시)
   - `commit()`으로 모든 작업 실행하고 결과 배열 반환

### 특수 유틸리티

1. **Sqflite.firstIntValue**

   ```dart
   Sqflite.firstIntValue(result) ?? 0
   ```

   - 쿼리 결과에서 첫 번째 행의 첫 번째 열의 정수값 추출
   - 주로 COUNT 등의 집계 쿼리 결과 추출에 사용

2. **ConflictAlgorithm**

   - `replace`: 기존 레코드 덮어쓰기
   - `ignore`: 충돌 시 무시하고 넘어감
   - `fail`: 충돌 시 예외 발생
   - `abort`: 충돌 시 트랜잭션 롤백
   - `rollback`: 충돌 시 트랜잭션 롤백하고 제약조건 위반

### 트랜잭션 관리

1. db.close()
   - 데이터베이스 연결 종료
   - 리소스 해제를 위해 더 이상 사용하지 않을 때 호출

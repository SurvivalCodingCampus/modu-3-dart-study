# other

## 파일시스템

### 파일조작의 기본 순서

- 열고, 읽거나 쓰고, 닫는다.

### 한 줄씩 읽기

```dart
final file = File('test.txt');
file.writeAsStringSync('Hello\n');
file.writeAsStringSync('World!\n', mode:FileMode.append);
print(file.readAsLinesSync());
// [asd, zxc, vbn]
```

### 해당 디렉토리에 있는지

```dart
Directory('/Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/').exists()
```



## UML

### **Unified Modeling Language**

- 소프트웨어를 시각적으로 표현하는 표준 도구
- 안드로이드 스튜디오설치
  - plugins -> marketplace -> plantUML



## DateTime 관련

### intl

- 메시지 번역, 복수형 및 성별, 날짜/숫자 형식 및 구문 분석, 양방향 텍스트 등을 포함한 국제화 및 현지화 기능을 제공

### DateTime.parse

- FormattedString을 기반으로 새로운 DateTime 인스턴스를 구성
- https://api.flutter.dev/flutter/dart-core/DateTime/parse.html

### 

### epoch 타임 설정

```
print(DateTime.fromMillisecondsSinceEpoch(0));
```





## 여러가지 데이터 형식

### CSV

```dart
String str = '홀길동,한석봉,신사임당';
```

### 프로퍼티 형식의 파일 읽기

- 키와 값의 쌍으로 읽고 쓰기가 가능

```properties
heroName=홍길동
hero=100
```

### XML 형식

- <> 태그를 활용한 기술 방식
- 포함관계를 기술할 수 있음

```xml
<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

- DOM Parser, SAX Parser(빠른 편) 등을 통해 파서를 제작할 필요가 있음
- 파싱: 원하는 것들을 바로바로 갖다쓰는 것



### JSON

- 네트워크 통신에서 가장 많이 사용되고 있음
- XML에 비해 적은 용량
- [] 로 리스트, {} 로 객체를 표현
- 키(key): 값(value) 형태

```json
{
  "이름": "홍길동",
  "나이": 25,
  "성별": "여",
  "주소": "서울특별시 양천구 목동",
  "특기": ["농구", "도술"],
  "가족관계": {"#": 2, "아버지": "홍판서", "어머니": "춘섬"},
  "회사": "경기 수원시 팔달구 우만동"
}
```

- Dart의 Map<String, dynamic> 과 똑같이 생겼음



### Build Runner 사용법

#### 일회성 코드 생성

- 프로젝트 루트에서 `dart run build_runner build --delete-conflicting-outputs` 명령어를 실행하면 모델에 필요한 JSON 직렬화 코드를 생성합니다.

#### 지속적인 코드 생성

- 프로젝트 루트에서 `dart run build_runner watch --delete-conflicting-outputs` 명령어를 실행하여 watcher를 시작합니다.



## 디버깅

- 소프트웨어의 오류를 식별하고 수정하는 과정

### 디버깅 기술

#### 로깅

- 코드가 실행되는 동안 발생하는 이벤트를 기록하는데 사용

#### 브레이킹포인트

- 코드의 특정 지점에서 실행을 중지하는데 사용

#### 디버거

- 디버깅을 도와주는 도구

#### 스택 추적

- 호출 스택을 추적하여 코드가 실행중인 위치를 확인하는데 사용

### 디버깅의 팁

- 작게 시작, 단순하게 유지, 인내심을 가져야 한다
- flutter에서는 에러가 나도 돌아가는 이유때문에 디버깅이 필요



### debug모드 활용

![스크린샷 2025-04-07 오전 10.14.31](/Users/okstring/Documents/image/스크린샷 2025-04-07 오전 10.14.31.png)


# 오류 처리 (Error Handling)



## 예외(Exception)

- 실행시에 예외상황이 발생할 가능성이 있는 것을 예측하여, 사전에 예외 처리가 되도록 할 필요가 있음

### 예외적인 상황들

- 메모리 부족, 파일 못찾음, 네트워크 통신 불가 등

### try-catch-finally 알쏭달쏭 상황

```dart
  int num;
  try {
    num = 1;
    print('try 블록 실행');
  } catch (e) {
    num = 1;
    print('예외 발생: $e');
  } finally {
    print('finally 블록은 항상 실행됨');
    print(num);
  }
// try 블록에서 예외가 발생하면 num = 1 할당이 실행되지 않을 수 있습니다.
// 예외가 발생했을 때 catch 블록에서 num = 1을 실행합니다.
// 하지만 코드 분석 시점에서는 try 블록에서 어떤 종류의 예외가 발생할지 알 수 없습니다.
// 중요한 문제: 만약 발생한 예외 타입이 catch (e)에서 처리되지 않는 다른 타입이라면, catch 블록의 num = 1도 실행되지 않습니다.
```



### rethrow

- 에러 처리를 미룸

- `rethrow`: 원래 예외의 스택 트레이스를 보존하여 실제 예외 발생 위치를 정확히 알 수 있음
- `throw e`: 현재 위치에서 새 스택 트레이스가 시작되어 원래 예외 발생 위치 정보가 손실됨

#### 예시 코드

```dart
void main() {
  try {
    firstFunction();
  } catch (e, stackTrace) {
    print('메인에서 예외 처리');
    print('예외: $e');
    print('스택 트레이스:\n$stackTrace');
  }
}

void firstFunction() {
  try {
    secondFunction();
  } catch (e) {
    print('firstFunction에서 예외 포착');
    
    // 방법 1: rethrow (원래 스택 트레이스 보존)
    rethrow;
    
    // 방법 2: throw e (새 스택 트레이스 생성 - 원래 위치 정보 손실)
    // throw e;
  }
}

void secondFunction() {
  // 실제 예외 발생 위치
  throw Exception('두 번째 함수에서 문제 발생!');
}
/*
firstFunction에서 예외 포착
메인에서 예외 처리
예외: Exception: 두 번째 함수에서 문제 발생!
스택 트레이스:
#0      secondFunction (file:///Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/num_solution.dart:27:3)
#1      firstFunction (file:///Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/num_solution.dart:13:5)
#2      main (file:///Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/num_solution.dart:3:5)
...
*/
```

#### 결과 차이

- `rethrow` 사용 시: 스택 트레이스에 `secondFunction()`에서 예외가 시작됐다는 정보가 포함됨
- `throw e` 사용 시: 스택 트레이스는 `firstFunction()`에서 예외가 시작된 것처럼 보임

디버깅할 때 `rethrow`를 사용하면 예외의 근본 원인을 더 쉽게 찾을 수 있습니다.

### on

```dart
try {
  someError2();
} on FormatException { // 해당 Exception만 예외처리
  print('FormatException이 발생했습니다.');
}
```



### Exception에 의미부여하면

- Exception에 의미부여가 잘 되어있으면 앱의 완성도에 크게 적용 가능하다.



## Dart에서 assert, exception, error 사용 가이드

### assert 사용 시기

- **개발 중 디버깅 용도**로 사용합니다.
- 함수나 메서드의 **전제 조건을 확인**할 때 사용합니다.
- 개발자가 예상하는 조건이 맞는지 확인할 때 사용합니다.
- 릴리즈 모드에서는 무시되므로 **프로덕션 코드의 동작에 영향을 주지 않는** 검증에 사용합니다.

```dart
void setVolume(int level) {
  assert(level >= 0 && level <= 100, "볼륨은 0부터 100 사이여야 합니다.");
  // 구현...
}
```

### Exception 사용 시기

- **프로그램 실행 중 발생할 수 있는 예상된 오류** 상황을 처리할 때 사용합니다.
- 복구 가능한 오류 상황에 사용합니다.
- 사용자 입력, 네트워크 요청, 파일 I/O 등의 외부 요인으로 인한 오류를 처리할 때 사용합니다.
- 호출자에게 오류 상황을 알리고 대처할 기회를 제공하려 할 때 사용합니다.

```dart
Future<String> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/api'));
    if (response.statusCode != 200) {
      throw HttpException('데이터를 가져오지 못했습니다. 상태 코드: ${response.statusCode}');
    }
    return response.body;
  } catch (e) {
    // 예외 처리
    throw DataFetchException('데이터 fetch 실패: $e');
  }
}
```

### Error 사용 시기

- **심각하고 예상치 못한 프로그램 오류**를 나타낼 때 사용합니다.
- 일반적으로 복구가 불가능하거나 복구를 시도하지 않아야 하는 심각한 문제를 나타냅니다.
- 프로그래밍 오류나 시스템 오류를 나타낼 때 사용합니다.

```dart
void processData(List<dynamic> data) {
  if (data == null) {
    // 이는 프로그래밍 오류입니다 - 호출자가 null을 전달해서는 안 됩니다
    throw ArgumentError('data는 null이 될 수 없습니다');
  }
  // 구현...
}
```

## 실제 사용 전략

1. **디버깅과 개발 시**: `assert`를 사용하여 개발 중에만 조건을 검증합니다.
2. **예상 가능한 오류 처리**: `try-catch`로 `Exception`을 포착하고 적절히 대응합니다.
3. **프로그래밍 오류**: 프로그래밍 오류나 불변 조건 위반은 `Error`를 발생시켜 알립니다.
4. **사용자 정의 예외**: 비즈니스 로직에 특화된 예외는 `Exception`을 상속하여 정의합니다.



### 
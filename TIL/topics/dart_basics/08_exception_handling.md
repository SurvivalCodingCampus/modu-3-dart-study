# 오류 처리 (Error Handling)





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
## 널 안전성 (Null Safety)

### 완전한 널 안전성 (Complete Null Safety)

### 널 안전성으로 마이그레이션 (Migrating to Null Safety)

### 널 안전성 이해하기 (Understanding Null Safety)



#### Dart의 Flow Analysis(흐름 분석) 방식

##### **첫 번째 케이스 (컴파일 에러 발생)**

```dart
if (m[num] != null) {
  for (final num in m[num]) {  // 컴파일 에러!
    ...
  }
}
```

- `m[num]`을 두 번 다른 시점에 접근하고 있음
- Map 접근은 매번 새로운 연산으로 간주됨
- 첫 번째 접근에서 null이 아님을 확인했더라도, 두 번째 접근은 다시 null일 수 있다고 판단
- 따라서 컴파일러는 안전성을 보장할 수 없어 에러 발생

##### **두 번째 케이스 (정상 동작)**

```dart
final list = m[num];      // 변수에 저장
if (list != null) {
  for (final num in list) { // OK!
    ...
  }
}
```

- 동일한 값을 변수에 저장하여 재사용
- null 체크 이후 변수의 값이 변경될 가능성이 없음
- 컴파일러가 안전성을 보장할 수 있음



### 불완전한 널 안전성 (Incomplete Null Safety)




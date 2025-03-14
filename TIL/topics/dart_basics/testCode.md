## Test 코드 작성

given > when > then 기법

given =준비

when = 실행

then = 검사

```dart
void main() {
  test('Cliaclic Test', () {
    //given(준비)
    Cleric cleric = Cleric();
    //when(실행)
    cleric.selfAid();
    cleric.pray(5);
    //then(검증)
    expect(cleric.mp, inInclusiveRange(0, 10));
    expect(cleric.hp, equals(50));
  });
}
```

expect가 받는 인자

| 범위 지정 | inInclusiveRange(0,10) |
|-------|------------------------|
| 동일한 값 | equals(50)             |
| 보다 크다 | greaterThan(5)         |
| 보다 작다 | lessThen(10)           |
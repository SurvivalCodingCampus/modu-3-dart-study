## Test

### Group

```dart
import 'package:flutter_unit_test/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('calculator', () {
    Calculator calc = Calculator();

    test('add should be equal to a + b', () {
      expect(calc.add(5, 8), equals(13));
    });

    test('minus should be equal to a - b', () {
      expect(calc.minus(10, 5), equals(5));
    });

    test('square should be equal to a * a', () {
      expect(calc.square(5), equals(25));
    });
  });
}
```





### throwsException

- 에러를 던지는 함수에 대한 매칭

### throwsA

`expect(functionThatThrows, throwsA(isA<SomeException>()));`





### 경계값 분석

경계값 분석(Boundary Value Analysis)은 테스트 기법 중 하나로, 입력값의 경계(최소값, 최대값) 근처에서 버그가 자주 발생하므로 경계값에서 집중적으로 테스트하는 방식



**📌 경계값 분석 뜻 (Boundary Value Analysis)**

| **항목**  | **설명**                                                 |
| --------- | -------------------------------------------------------- |
| 목적      | **오류가 발생하기 쉬운 경계에서 테스트**하여 안정성 확인 |
| 대상      | 입력값의 **최소값, 최대값**, 그리고 그 **바로 근처 값**  |
| 기대 효과 | 최소한의 테스트로 **효율적**으로 문제를 발견 가능        |


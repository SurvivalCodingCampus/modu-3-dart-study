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


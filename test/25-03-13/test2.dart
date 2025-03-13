import 'package:modu_3_dart_study/25-03-13/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric Test', () {
    int value = 10;

    print('Testing value: $value');

    expect(value, greaterThan(5));
    expect(value, lessThan(15));
    expect(value, inInclusiveRange(5, 15));
  });
}
import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-25/exception.dart';

void main() {
  group('Exception(문자열 정수로 바꾸기)', () {
    test('정수 문자열', () {
      expect(stringToInt('10'), equals(10));
    });

    test('소수점 문자열', () {
      expect(stringToInt('10.5'), equals(0));
    });

    test('숫자가 아닌 문자열', () {
      expect(stringToInt('ABC'), equals(0));
    });

    test('빈문자열', () {
      expect(stringToInt(''), equals(0));
    });
  });
}

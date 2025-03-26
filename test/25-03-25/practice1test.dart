import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Format Exception Test', () {
    test('정수가 아닐때 ', () {
      final numString = '10.5';
      int num = 0;
      try {
        num = int.parse(numString);
      } on FormatException {
        num = 0;
      }
      expect(num, 0);
    });
    test('정수일때 ', () {
      final numString = '10';
      int num = 0;
      try {
        num = int.parse(numString);
      } on FormatException {
        num = 0;
      }
      expect(num, 10);
    });
  });
}

import 'package:test/test.dart';

void main() {
  const String numString = '10.5';

  test('실행시 Runtime Error가 발생되야한다.', () {
    int parse() {
      return int.parse(numString);
    }

    expect(() => parse(), throwsA(isA<Exception>()));
  });
  test('예외가 발생하면 try-catch 구문을 사용하여 처리해야 한다.', () {
    int parse() {
      try {
        return int.parse(numString);
      } on FormatException {
        return 0;
      }
    }

    expect(parse(), equals(0));
  });
}

import 'package:test/test.dart';

void main() {
  test('Exception', () {
    // given
    final numString = '10.5';

    int checkException(String numString) {
      try {
        return int.parse(numString);
      } catch (e) {
        return 0;
      }
    }

    // then
    expect(() => int.parse(numString), throwsA(isA<Exception>()));
    expect(checkException(numString), 0);
  });
}

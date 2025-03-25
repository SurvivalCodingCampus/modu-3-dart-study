import 'package:test/test.dart';

void main() {
  const numString = '10.5';

  int solutionTest() {
    try {
      int num = int.parse(numString);

      return num;
    } on FormatException {
      return 0;
    }
  }

  test('solution 01', () {
    expect(solutionTest(), 0);
  });
}

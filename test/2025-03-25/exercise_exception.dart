import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

int parseException(String input) {
  try {
    return int.parse(input);
  } catch (e) {
    return 0;
  }
}

void main() {
  test('실패시 catch', () {
    final result = parseException('10.5');
    expect(result, equals(0));
  });

  test('성공', () {
    final result = parseException('10');
    expect(result, equals(10));
  });
}

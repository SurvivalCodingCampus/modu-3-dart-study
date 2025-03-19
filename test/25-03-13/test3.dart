import 'package:test/test.dart';

import '../../assignments/character/cleric.dart';

void main() {
  test('Cleric pray Test', () {
    int value = 10;
    // given
    final cleric = Cleric('성직자', 50, 1);

    // when
    final restoredMp = cleric.pray(value);

    // then
    expect(restoredMp, greaterThanOrEqualTo(0));
    expect(restoredMp, lessThanOrEqualTo(3));
    expect(cleric.mp, equals(10 + restoredMp));
  });
}

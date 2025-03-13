import 'package:test/test.dart';

import '../../assignments/2025-03-13/cleric.dart';

void main() {
  test('Cleric Test', () {
    final cleric = Cleric('클레릭', 50, 10);

    cleric.selfAid();

    expect(cleric.mp, equals(5));
  });

  test('Cleric Test', () {
    final cleric = Cleric('클레릭', 50, 1);

    int result = cleric.pray(3);

    expect(result, inInclusiveRange(3, 5));
    expect(cleric.mp, inInclusiveRange(4, 6));
  });
}

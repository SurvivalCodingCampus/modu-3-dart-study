import 'package:test/test.dart';

import '../../assignments/2025-03-13/solution1.dart';

void main() {
  //연습 문제 2
  test('Self Aid 사용', () {
    final Cleric cleric = Cleric(30, 10, '유준');

    cleric.selfAid();

    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(5));
  });
}

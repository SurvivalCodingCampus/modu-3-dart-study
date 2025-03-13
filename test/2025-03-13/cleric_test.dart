import 'package:test/test.dart';

import '../../assignments/2025-03-13/cleric.dart';

void main() {
  test('Cleric selfAid Success', () {
    // given
    final Cleric cleric = Cleric('cleric');

    // when
    cleric.hp = 10;
    cleric.selfAid();

    // then
    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(5));
  });

  test('Cleric selfAid Fail', () {
    // given
    final Cleric cleric = Cleric('cleric');

    // when
    cleric.hp = 10;
    cleric.mp = 4;
    cleric.selfAid();

    // then
    expect(cleric.hp, equals(10));
    expect(cleric.mp, equals(4));
  });

  test('Cleric pray Success', () {
    // given
    final Cleric cleric = Cleric('cleric');
    const int sec = 3;
    const int initMP = 2;

    // when
    cleric.mp = initMP;
    final int result = cleric.pray(sec);

    // then
    expect(cleric.mp, equals((initMP + result) > 10 ? 10 : initMP + result));
    expect(result, inInclusiveRange(sec, sec + 3));
    expect(cleric.mp, lessThanOrEqualTo(10));
  });

  test('Cleric pray Fail', () {
    // given
    final Cleric cleric = Cleric('cleric');
    const int sec = 0;
    const int initMP = 2;

    // when
    cleric.mp = initMP;
    final int result = cleric.pray(sec);

    // then
    expect(cleric.mp, equals((initMP + result) > 10 ? 10 : initMP + result));
    expect(result, inInclusiveRange(sec, sec + 3));
    expect(cleric.mp, lessThanOrEqualTo(10));
  });
}

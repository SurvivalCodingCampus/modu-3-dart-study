import 'package:test/test.dart';

import '../../assignments/2025-03-14/cleric.dart';

void main() {
  const String testName = '아서스';
  const int testMaxHp = 50;
  const int testMaxMp = 10;
  const int defaultHp = 50;
  const int defaultMp = 10;

  test("Perfect Cleric Create", () {
    // given
    final int testHp = 40;
    final int testMp = 5;
    final Cleric cleric = Cleric(testName, hp: testHp, mp: testMp);

    //then
    expect(cleric.name, equals(testName));
    expect(cleric.hp, equals(testHp));
    expect(cleric.mp, equals(testMp));
    expect(Cleric.maxHp, equals(testMaxHp));
    expect(Cleric.maxMp, equals(testMaxMp));
  });

  test("lost mp in cunstructor Cleric Create", () {
    // given
    final int testHp = 35;
    final Cleric cleric = Cleric(testName, hp: testHp);

    //then
    expect(cleric.name, equals(testName));
    expect(cleric.hp, equals(testHp));
    expect(cleric.mp, equals(defaultMp));
    expect(Cleric.maxHp, equals(testMaxHp));
    expect(Cleric.maxMp, equals(testMaxMp));
  });

  test("lost hp and mp in cunstructor Cleric Create", () {
    // given
    final Cleric cleric = Cleric(testName);

    //then
    expect(cleric.name, equals(testName));
    expect(cleric.hp, equals(defaultHp));
    expect(cleric.mp, equals(defaultMp));
    expect(Cleric.maxHp, equals(testMaxHp));
    expect(Cleric.maxMp, equals(testMaxMp));
  });
}

import 'package:test/test.dart';
import '../../assignments/2025-03-14/cleric.dart';

void main() {
  // 과제1 test
  test('test1', () {
    Cleric park = Cleric('아서스', hp: 50, mp: 10);

    expect(park.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(park.mp, inInclusiveRange(0, Cleric.maxMp));
  });

  // 과제2 test
  test('test2-A', () {
    Cleric park = Cleric('아서스', hp: 40, mp: 5);

    expect(park.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(park.mp, inInclusiveRange(0, Cleric.maxMp));
  });

  test('test2-B', () {
    Cleric park = Cleric('아서스', hp: 35);

    expect(park.mp, equals(Cleric.maxMp));
  });

  test('test2-C', () {
    Cleric park = Cleric('아서스');

    expect(park.hp, equals(Cleric.maxHp));
    expect(park.mp, equals(Cleric.maxMp));
  });

  // selfAid
  test('selfAid test', () {
    Cleric park = Cleric('아서스', hp: 50, mp: 10);

    park.selfAid();

    expect(park.hp, inInclusiveRange(0, Cleric.maxHp));

    expect(park.mp, inInclusiveRange(0, Cleric.maxMp));
  });

  // pray
  test('pray test', () {
    Cleric park = Cleric('아서스', hp: 50, mp: 10);

    park.pray(10);

    expect(park.hp, inInclusiveRange(0, Cleric.maxHp));

    expect(park.mp, inInclusiveRange(0, Cleric.maxMp));
  });
}

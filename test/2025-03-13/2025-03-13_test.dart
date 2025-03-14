import 'package:test/test.dart';
import '../../assignments/2025-03-13/2025-03-13.dart';

void main() {
  test('Cleric test', () {
    Cleric park = Cleric('성직자', 50, 10);

    expect(park.hp, equals(50));

    expect(park.mp, equals(10));
  });

  test('selfAid test', () {
    Cleric park = Cleric('성직자', 50, 10);

    park.selfAid();

    expect(park.hp, inInclusiveRange(0, park.maxHp));

    expect(park.mp, inInclusiveRange(0, park.maxMp));
  });

  test('pray test', () {
    Cleric park = Cleric('성직자', 50, 10);

    park.pray(10);

    expect(park.hp, inInclusiveRange(0, park.maxHp));

    expect(park.mp, inInclusiveRange(0, park.maxMp));
  });
}
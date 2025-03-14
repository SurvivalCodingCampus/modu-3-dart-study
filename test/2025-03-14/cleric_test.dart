import 'package:modu_3_dart_study/2025-03-14/Cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric - 이름,HP,MP를 지정', () {
    // GIVEN
    final Cleric cleric = Cleric('최윤석', hp: 30, mp: 5);

    // THEN
    expect(cleric.hp, equals(30));
    expect(cleric.mp, equals(5));
  });

  test('Cleric - 이름, HP만 지정', () {
    // GIVEN
    final Cleric cleric = Cleric('최윤석', hp: 10);

    // THEN
    expect(cleric.hp, equals(10));
    expect(cleric.mp, equals(10));
  });

  test('Cleric - 이름만 지정', () {
    // GIVEN
    final Cleric cleric = Cleric('최윤석');

    // THEN
    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(10));
  });
}

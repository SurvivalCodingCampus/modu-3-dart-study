import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-13/hero.dart';
import 'package:modu_3_dart_study/2025-03-17/wizard.dart';

void main() {
  test('마나가 부족할 때 힐을 시전하지 않음', () {
    Hero hero = Hero(name: '용사', hp: 50);
    Wizard wizard = Wizard('소라카', 100, 5);  // MP 5로 설정하여 부족하게 만듦

    wizard.heal(hero);

    expect(hero.hp, equals(50));  // 힐이 안 되었으므로 hero의 HP는 50
    expect(wizard.mp, equals(5));  // MP는 그대로 5로 남아 있어야 함
  });

  test('마나가 충분할 때 힐을 시전함', () {
    Hero hero = Hero(name: '용사', hp: 50);
    Wizard wizard = Wizard('소라카', 100, 50);  // MP 50으로 설정

    wizard.heal(hero);

    expect(hero.hp, equals(70));  // 힐 후 hero의 HP는 70
    expect(wizard.mp, equals(40));  // wizard의 MP는 10 소모되어 40이어야 함
  });
}
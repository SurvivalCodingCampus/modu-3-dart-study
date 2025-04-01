import 'package:modu_3_dart_study/2025-03/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-18/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('[Wizard]', () {
    test('heal 메서드를 사용하면 MP를 10 소모하고 용사의 HP를 20 회복시켜야한다.', () {
      // Given
      final Wizard wizard = Wizard('A');
      final Hero hero = Hero('Hero');
      hero.hp -= 20;

      // When
      wizard.heal(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp));
      expect(wizard.mp, equals(Hero.maxMp - 10));
    });

    test('마나가 부족하면 "마나가 부족합니다."가 출력되고 기능이 수행되지 않아야한다.', () {
      // Given
      final Wizard wizard = Wizard('A');
      final Hero hero = Hero('Hero');
      wizard.mp = 9;

      // When
      wizard.heal(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp));
    });
  });

  group('[GreatWizard]', () {
    test('superHeal 메서드를 사용하면 MP를 50 소모하고 용사의 HP를 전부 회복시켜야한다.', () {
      // Given
      final GreatWizard wizard = GreatWizard('A');
      final Hero hero = Hero('Hero');
      hero.hp -= 10;

      // When
      wizard.superHeal(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp));
      expect(wizard.mp, equals(GreatWizard.maxMp - 50));
    });

    test('마나가 부족하면 "마나가 부족합니다."가 출력되고 기능이 수행되지 않아야한다.', () {
      // Given
      final GreatWizard wizard = GreatWizard('A');
      final Hero hero = Hero('Hero');
      wizard.mp = 49;

      // When
      wizard.superHeal(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp));
    });
  });
}

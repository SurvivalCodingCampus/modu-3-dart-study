import 'package:test/test.dart';
import '../../assignments/2025-03-18/wizard_modify.dart';
import '../../assignments/2025-03-18/hero.dart';

void main() {
  group('Wizard Heal Test', () {
    test('Wizard Heal Test', () {
      Hero hero = Hero("전사", 50);
      Wizard wizard = Wizard("마법사");

      wizard.heal(hero);

      expect(hero.hp, equals(70)); // HP 50 → 70 증가 확인
      expect(wizard.mp, equals(90)); // MP 100 → 90 감소 확인
    });
  });
}


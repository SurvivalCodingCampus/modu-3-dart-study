import 'package:modu_3_dart_study/2025-03-14/hero.dart';
import 'package:test/test.dart';
import '../../assignments/2025-03-18/great_wizard.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  group('wizard', () {
    test('wizard 초기 값 세팅', () {
      Wizard wizard = Wizard(name: '오애순', hp: 50);

      expect(wizard, isA<Wizard>());
      expect(wizard.name, '오애순');
      expect(wizard.hp, 50);
      expect(wizard.mp, 100);
    });

    test('wizard heal 메소드', () {
      Wizard wizard = Wizard(name: '오애순', hp: 50);
      Hero hero = Hero(name: '양관식', hp: 20);

      wizard.heal(hero);

      expect(wizard, isA<Wizard>());
      expect(wizard.name, '오애순');
      expect(wizard.hp, 50);
      expect(wizard.mp, 90);

      expect(hero, isA<Hero>());
      expect(hero.name, '양관식');
      expect(hero.hp, 40);
      expect(wizard.mp, 90);
    });

    test('wizard heal 메소드 mp부족', () {
      Wizard wizard = Wizard(name: '오애순', hp: 50, mp: 9);
      Hero hero = Hero(name: '양관식', hp: 20);

      wizard.heal(hero);

      expect(wizard.name, '오애순');
      expect(wizard.mp, 9);

      expect(hero.name, '양관식');
      expect(hero.hp, 20);
    });
  });

  group('greatWizard', () {
    test('greatWizard 초기 값 세팅', () {
      GreatWizard greatWizard = GreatWizard(name: '오애순', hp: 50);

      expect(greatWizard, isA<Wizard>());
      expect(greatWizard.name, '오애순');
      expect(greatWizard.hp, 50);
      expect(greatWizard.mp, 150);
    });

    test('greatWizard heal메소드', () {
      GreatWizard greatWizard = GreatWizard(name: '오애순', hp: 50);
      Hero hero = Hero(name: '양관식', hp: 30);

      greatWizard.superHeal(hero);

      expect(greatWizard, isA<Wizard>());
      expect(greatWizard.name, '오애순');
      expect(greatWizard.hp, 50);
      expect(greatWizard.mp, 100);

      expect(hero.name, '양관식');
      expect(hero.hp, Hero.maxHp);
    });
  });
}

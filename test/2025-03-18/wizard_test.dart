import 'package:test/test.dart';

import '../../assignments/2025-03-18/great_wizard.dart';
import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  const String wizardName = 'harry potter';
  const int wizardHp = 50;
  const String heroName = 'B';
  const int heroHp = 50;

  group('위대한 마법사 : ', () {
    test('완벽한 생성', () {
      // given
      GreatWizard greatWizard = GreatWizard(name: wizardName, hp: wizardHp);

      // then
      expect(greatWizard, isA<GreatWizard>());
      expect(greatWizard.name, equals(wizardName));
      expect(greatWizard.hp, equals(wizardHp));
      expect(greatWizard.mp, equals(GreatWizard.greateWizardDefaultMp));
    });

    test('일반 회복 사용', () {
      // given
      GreatWizard greatWizard = GreatWizard(name: wizardName, hp: wizardHp);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      greatWizard.heal(hero);

      // then
      expect(hero.hp, equals(heroHp + Wizard.healAmount));
      expect(
        greatWizard.mp,
        equals(GreatWizard.greateWizardDefaultMp - Wizard.useHealMp),
      );
    });

    test('일반 회복 실패', () {
      // given
      GreatWizard greatWizard = GreatWizard(name: wizardName, hp: wizardHp);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      greatWizard.mp = 9;
      greatWizard.heal(hero);

      // then
      expect(hero.hp, equals(heroHp));
      expect(greatWizard.mp, equals(9));
    });

    test('슈퍼 회복 사용', () {
      // given
      GreatWizard greatWizard = GreatWizard(name: wizardName, hp: wizardHp);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      greatWizard.superHeal(hero);

      // then
      expect(hero.hp, equals(Hero.maxHp));
      expect(
        greatWizard.mp,
        equals(GreatWizard.greateWizardDefaultMp - GreatWizard.superHealUseMp),
      );
    });

    test('슈퍼 회복 실패', () {
      // given
      GreatWizard greatWizard = GreatWizard(name: wizardName, hp: wizardHp);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      greatWizard.mp = 49;
      greatWizard.superHeal(hero);

      // then
      expect(hero.hp, equals(heroHp));
      expect(greatWizard.mp, equals(49));
    });
  });
}

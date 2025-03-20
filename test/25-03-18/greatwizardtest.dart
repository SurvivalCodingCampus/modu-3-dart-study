import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/character/greatwizard.dart';
import '../../assignments/character/hero.dart';

void main() {
  group('GreatWizard test', () {
    test('SuperHeal test', () {
      //given
      final greatwizard = GreatWizard('마법사', 100);
      final hero = Hero('용사', 100);

      //when
      greatwizard.superHeal(hero);

      //then
      expect(hero.hp, equals(Hero.maxHp));
      expect(greatwizard.mp, equals(100));
    });
    test('mp 부족', () {
      //given
      final greatwizard = GreatWizard('마법사', 100, mp: 49);
      final hero = Hero('용사', 100);

      //when
      greatwizard.superHeal(hero);

      //then
      expect(hero.hp, equals(100));
    });
  });
}

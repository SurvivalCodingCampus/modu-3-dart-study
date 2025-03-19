import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/character/hero.dart';
import '../../assignments/character/wizard.dart';



void main() {
  group('Wizard test',() {
    test('heal test', () {
      //given
      Wizard wizard = Wizard('마법사', 100, 100);
      Hero hero = Hero('용사', 100);

      //when
      wizard.heal(hero);

      //then
      expect(hero.hp, equals(120));
      expect(wizard.mp, equals(90));
    });

    test('heal 마나부족', () {
      //given
      Wizard wizard = Wizard('마법사', 100, 9);
      Hero hero = Hero('용사', 100);

      //when
      wizard.heal(hero);

      //then
      expect(hero.hp, equals(100));
    });
  });

}
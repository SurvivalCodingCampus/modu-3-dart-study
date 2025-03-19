import 'dart:math';

import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  PoisonSlime poisonSlime = PoisonSlime(suffix: 'A');
  Hero hero = Hero(100);
  group('poison', () {
    test('attack: a,d', () {
      poisonSlime.attack(hero);
      expect(hero.hp, 72);
    });
    test('poison Count: b,c,e', () {
      // poisonSlime.attack(hero);
      // int firstAttack = poisonSlime.poisonCount;
      //
      // poisonSlime.attack(hero);
      // int secondAttack = poisonSlime.poisonCount;
      //
      // poisonSlime.attack(hero);
      // int thirdAttack = poisonSlime.poisonCount;
      //
      // poisonSlime.attack(hero);
      // int fourthAttack = poisonSlime.poisonCount;
      //
      // poisonSlime.attack(hero);
      // int fifthAttack = poisonSlime.poisonCount;
      //
      // poisonSlime.attack(hero);
      //
      // expect(poisonSlime.poisonCount, equals(0));
      // expect(firstAttack, equals(4));
      // expect(secondAttack, equals(3));
      // expect(thirdAttack, equals(2));
      // expect(fourthAttack, equals(1));
      // expect(fifthAttack, equals(0));
      expect(poisonSlime.poisonCount, equals(5));

      for (int expected = 4; expected >= 0; expected--) {
        poisonSlime.attack(hero);
        expect(poisonSlime.poisonCount, equals(expected));
      }
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonCount, equals(0));
    });
  });
}

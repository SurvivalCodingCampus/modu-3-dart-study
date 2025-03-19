import 'dart:math';

import 'package:modu_3_dart_study/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime', () {
    test('hp를 10 감소시키고 추가로 hp의 1/5를 감소시킨다. poisonCount를 1 감소시킨다', () {
      const name = '용사';
      const hp = 50;
      final Hero hero = Hero(name: name, hp: hp);
      final PoisonSlime poisonSlime = PoisonSlime('A');

      int currentPoisonCount = poisonSlime.poisonCount;
      poisonSlime.attack(hero: hero);

      expect(hero.hp, closeTo((hp - 10) * 4 / 5, 1));
      expect(poisonSlime.poisonCount, equals(currentPoisonCount - 1));
      expect(hero.name, equals(name));
    });
  });
}

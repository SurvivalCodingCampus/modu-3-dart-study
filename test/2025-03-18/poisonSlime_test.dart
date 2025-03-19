import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/poisonSlime.dart';

void main() {
  group(('SuperHero test'), () {
    test('Hero attacks PoisonSlime', () {
      final Hero hero = Hero(name: '야무치', hp: 100);
      final PoisonSlime poisonSlime = PoisonSlime('T');

      hero.attack(poisonSlime);

      expect(poisonSlime.hp, equals(40));
    });
    test('Hero kills PoisonSlime', () {
      final Hero hero = Hero(name: '야무치', hp: 10);
      final PoisonSlime poisonSlime = PoisonSlime('T');

      hero.attack(poisonSlime);
      hero.attack(poisonSlime);
      hero.attack(poisonSlime);
      hero.attack(poisonSlime);
      hero.attack(poisonSlime);

      expect(poisonSlime.hp, equals(0));
    });
    test('PoisonSlime attacks Hero', () {
      final Hero hero = Hero(name: '야무치', hp: 100);
      final PoisonSlime poisonSlime = PoisonSlime('T');

      poisonSlime.attack(hero);

      expect(hero.hp, lessThan(90));
    });
    test('PoisonSlime kills Hero', () {
      final Hero hero = Hero(name: '야무치', hp: 10);
      final PoisonSlime poisonSlime = PoisonSlime('T');

      poisonSlime.attack(hero);

      expect(hero.hp, equals(0));
    });
  });
}

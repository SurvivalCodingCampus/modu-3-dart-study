import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/character/hero.dart';
import '../../assignments/character/slime.dart';


void main () {
  group('PoisonSlimeTest', (){
    test('PoisonCount 1 이상 test', (){
      //given
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero('name', 100);
      //when
      poisonSlime.attack(hero);

      //then
      expect(hero.hp, equals(72));
      expect(poisonSlime.poisonCount, equals(4));

    });
    test('PoisonCount 0 test', () {
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero('name', 100);
      poisonSlime.poisonCount = 0;

      poisonSlime.attack(hero);

      expect(hero.hp, equals(90));
    });
  });
}


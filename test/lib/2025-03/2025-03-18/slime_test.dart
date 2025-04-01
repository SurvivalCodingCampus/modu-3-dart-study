import 'package:modu_3_dart_study/2025-03/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-18/poison_slime.dart'
    show PoisonSlime;
import 'package:modu_3_dart_study/2025-03/2025-03-18/slime.dart';
import 'package:test/test.dart';

void main() {
  group('[Slime]', () {
    test('공격 메서드를 호출하면 데미지를 입혀야한다.', () {
      // Given
      final Slime slime = Slime('Slime 1');
      final Hero hero = Hero('Hero 1');

      // When
      slime.attack(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp - Slime.ap));
    });
  });

  group('[PoisonSlime]', () {
    test('공격 메서드를 호출하면 추가로 독 데미지를 입혀야한다.', () {
      // Given
      final PoisonSlime poisonSlime = PoisonSlime('PoisonSlime 1');
      final Hero hero = Hero('Hero 1');
      final int finalHp = Hero.maxHp - Slime.ap - (Hero.maxHp - Slime.ap) ~/ 5;

      // When
      poisonSlime.attack(hero);

      // Then
      expect(hero.hp, equals(finalHp));
    });
    test('poisonCount가 0이면 추가 독 데미지를 입힐 수 없어야한다.', () {
      // Given
      final PoisonSlime poisonSlime = PoisonSlime('PoisonSlime 2');
      final Hero hero = Hero('Hero 1');

      // When
      poisonSlime.poisonCount = 0;
      poisonSlime.attack(hero);

      // Then
      expect(hero.hp, equals(Hero.maxHp - Slime.ap));
    });
  });
}

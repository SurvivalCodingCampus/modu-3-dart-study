import '../../assignment/2025-03-18/hero.dart';
import '../../assignment/2025-03-18/slime.dart';
import 'package:test/test.dart';

void main() {
  group('Slime 테스트', () {
    test('Slime은 attack 시 hero 체력이 닳아야 한다.', () {
      final slime = Slime('-mini');
      const hp = 100;
      const count = 10;
      final hero = Hero(name: '홍길동', hp: hp);

      for (int i = 0; i < count; i++) {
        slime.attack(hero);
      }

      expect(hero.hp, hp - Slime.attackDamage * count);

      slime.attack(hero);

      expect(hero.hp, 0);
    });

    test('Slime은 hp가 0 이하로 떨어지지 않는다.', () {
      final slime = Slime('-mini');
      const hp = 0;
      final hero = Hero(name: '홍길동', hp: hp);

      slime.attack(hero);

      expect(hero.hp, 0);
    });
  });
}
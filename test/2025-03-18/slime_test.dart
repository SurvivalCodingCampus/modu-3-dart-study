import 'package:modu_3_dart_study/2025-03-14/hero.dart';
import 'package:test/test.dart';
import '../../assignments/2025-03-18/poison_slime.dart';
import '../../assignments/2025-03-18/slime.dart';

void main() {
  group('PoisonSlime 클래스 테스트', () {
    test('PoisonSlime 객체 생성 및 초기화', () {
      PoisonSlime poisonSlime = PoisonSlime('A');

      expect(poisonSlime, isA<Slime>());
      expect(poisonSlime.suffix, 'A');
      expect(poisonSlime.poisonCount, 5);
    });

    test('PoisonSlime 객체의 독 공격', () {
      Hero hero = Hero(name: '지롱', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('A');

      int preHp = hero.hp;
      poisonSlime.attack(hero);

      expect(hero.hp, (preHp - 10) - ((preHp - 10) / 5).toInt());
      expect(poisonSlime.poisonCount, 4);
    });

    test('poisonCount가 0이면 독 공격을 못 함', () {
      Hero hero = Hero(name: '지롱', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('A');
      poisonSlime.poisonCount = 0;

      poisonSlime.attack(hero);

      expect(poisonSlime.poisonCount, 0);
      expect(hero.hp, 90);
      expect(poisonSlime.poisonCount, 0);
    });
  });
}

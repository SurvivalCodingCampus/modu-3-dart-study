import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';
import 'package:modu_3_dart_study/2025-03-18/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('Poison Slime 테스트', () {
    test('Poison Slime은 Slime 자식 클래스다', () {
      final slime = PoisonSlime('-mini');
      expect(slime, isA<Slime>());
    });

    test('독 공격 시 추가로 hp를 1/5 감소시킨다', () {
      final poisonSlime = PoisonSlime('-mini');
      const hp = 10000;
      const count = 2;
      final hero = Hero(name: '홍길동', hp: hp);

      int expectHp = hp;
      for (int i = 0; i < count; i++) {
        poisonSlime.attack(hero);
        // 기본 attack Damage 이후 1/5 데미지 추가
        expectHp =
            (expectHp -
                Slime.attackDamage -
                ((expectHp - Slime.attackDamage) * 0.2).toInt());
      }

      expect(hero.hp, expectHp);
    });

    test('poison Count가 다 소진되면 poison 공격이 불가능하다.', () {
      final poisonSlime = PoisonSlime('-mini');
      const hp = 10000;
      final initialPoisonCount = poisonSlime.poisonCount;
      final hero = Hero(name: '홍길동', hp: hp);

      for (int i = 0; i < initialPoisonCount; i++) {
        poisonSlime.attack(hero);
      }

      final hpAfterPoisonAttacks = hero.hp;

      poisonSlime.attack(hero);

      expect(poisonSlime.poisonCount, 0);
      expect(hero.hp, hpAfterPoisonAttacks - Slime.attackDamage);
    });
  });
}

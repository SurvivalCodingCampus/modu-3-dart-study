import 'package:test/test.dart';

import '../../../../assignments/2025-03-18/src/solution/hero.dart';
import '../../../../assignments/2025-03-18/src/solution/poison_slime.dart';

void main() {
  group('Poison Slime - 초기값', () {
    test('Hero의 hp갑 지정해준 경우', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero(name: '홍길동', hp: 50);

      // then
      expect(poisonSlime.suffix, equals('A'));
      expect(poisonSlime.hp, equals(50));
      expect(poisonSlime.poisonCount, equals(5));
      expect(hero.name, equals('홍길동'));
      expect(hero.hp, equals(50));
    });

    test('Hero의 hp갑 지정안한 경우', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero(name: '홍길동');

      // then
      expect(poisonSlime.suffix, equals('A'));
      expect(poisonSlime.hp, equals(50));
      expect(poisonSlime.poisonCount, equals(5));
      expect(hero.name, equals('홍길동'));
      expect(Hero.maxHp, equals(100)); // 최대 HP값 = 100
      expect(hero.hp, equals(100)); // HP값 미지정 시 최대 HP값으로 설정
    });
  });

  group('Poison Slime - attack', () {
    // given
    PoisonSlime poisonSlime = PoisonSlime('A');
    Hero hero = Hero(name: '홍길동', hp: 50);
    test('성공', () {
      // when
      poisonSlime.attack(hero);

      // then
      expect(poisonSlime.poisonCount, equals(4)); // 공격 후 poisonCount -1, 초기값 5
      // 기본 공격에 대한 hp(10)만 소모됨. 독 공격 데미지까지 같이 소모되어야 함
      // 기본 공격 데미지 10, 독 공격 데미지 (보유 hp / 5) = 8 => (50 - 10 - 8) = 32
      expect(hero.hp, equals(32));
    });

    test('성공 - poisonCount 부족', () {
      poisonSlime.poisonCount = 0;

      // when
      poisonSlime.attack(hero);

      // then
      // poisonCount 부족으로 독 공격 불가능. 기본 공격만 적용
      expect(poisonSlime.poisonCount, equals(0));
      expect(hero.hp, equals(40)); // 기본 데미지 10만큼 감소
    });

    test('실패 - poisonCount 차감 안됨', () {
      // when
      poisonSlime.attack(hero);

      // then
      expect(poisonSlime.poisonCount, equals(5)); // 공격 후 poisonCount -1, 초기값 5
      expect(hero.hp, equals(32));
    });

    test('실패 - hero.hp 값 오류', () {
      // when
      poisonSlime.attack(hero);

      // then
      expect(poisonSlime.poisonCount, equals(4));
      expect(hero.hp, equals(40)); // 기본 공격에 대한 데미지만 소모됨(10)
    });
  });
}

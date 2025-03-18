import 'package:test/test.dart';

import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/poison_slime.dart';
import '../../assignments/2025-03-18/slime.dart';

void main() {
  const String slimeName = 'A';
  const String heroName = 'B';
  const int heroHp = 50;

  group('독 슬라임 : ', () {
    test('완벽 생성', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime(slimeName);

      // then
      expect(poisonSlime, isA<PoisonSlime>());
      expect(poisonSlime.suffix, equals(slimeName));
      expect(poisonSlime.hp, equals(Slime.defaultHp));
      expect(poisonSlime.poisonCount, equals(PoisonSlime.defaultPoisonCount));
    });

    test('독 공격 성공', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime(slimeName);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      poisonSlime.attack(hero);

      // then
      expect(
        poisonSlime.poisonCount,
        equals(PoisonSlime.defaultPoisonCount - 1),
      );
      expect(hero.hp, equals(32));
    });

    test('독 공격 실패', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime(slimeName);
      Hero hero = Hero(name: heroName, hp: heroHp);

      // when
      poisonSlime.poisonCount = 0;
      poisonSlime.attack(hero);

      // then
      expect(poisonSlime.poisonCount, equals(0));
      expect(hero.hp, equals(40));
    });

    test('독 공격 횟수 음수 삽입 검사', () {
      // given
      PoisonSlime poisonSlime = PoisonSlime(slimeName);

      // when
      poisonSlime.poisonCount = -5;

      // then
      expect(poisonSlime.poisonCount, equals(0));
    });
  });
}

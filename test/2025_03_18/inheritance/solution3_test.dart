import 'package:test/test.dart';

import '../../../assignments/2025_03_18/inheritance/solution3/hero.dart';
import '../../../assignments/2025_03_18/inheritance/solution3/poison_slime.dart';
import '../../../assignments/2025_03_18/inheritance/solution3/slime.dart';

void main() {
  group('Slime', () {
    final slime = Slime('흐물');
    final hero = Hero(50, '유준');

    test('인스턴스 생성 완료', () {
      expect(slime.suffix, '흐물');
      expect(slime.hp, 50);
    });
    test('Slime 생성 후 공격', () {
      // 공격 후 hero 의 hp
      slime.attack(hero: hero);
      expect(hero.hp, 40);
    });

    group('Posion Slime', () {
      final posionSlime = PoisonSlime('단단');
      final hero = Hero(50, '유준');

      test('인스턴스 생성 완료', () {
        // 인스턴스 생성 완료
        expect(posionSlime.hp, 50);
        expect(posionSlime.suffix, '단단');
        expect(posionSlime.poisonCount, 5);
      });

      test('독 공격 후 남은 hp 및 남은 횟수', () {
        // 독 공격
        posionSlime.attack(hero: hero);

        // 독 공격과 일반 공격을 맞은 hero 의 hp
        expect(hero.hp, 30);
        print('남은 hp 량 : ${hero.hp}');

        // 남은 횟수
        expect(posionSlime.poisonCount, 4);
        print('남은 독 공격 횟수 : ${posionSlime.poisonCount}');
      });
    });
  });
}

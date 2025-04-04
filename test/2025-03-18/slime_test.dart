import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-13/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';

void main() {
  group('PoisonSlime 테스트', () {
    test('독 공격이 정상적으로 적용되는지 확인', () {
      Hero hero = Hero(name: '용사', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('A');

      poisonSlime.attack(hero);

      // 슬라임 기본 공격 (10 데미지) + 독 공격 (18 데미지) => 총 30 감소
      expect(hero.hp, equals(72));

      // poisonCount가 1 감소했는지 확인
      expect(poisonSlime.poisonCount, equals(4));
    });

    test('독 공격이 poisonCount가 0일 때 실행되지 않는지 확인', () {
      Hero hero = Hero(name: '용사', hp: 150);
      PoisonSlime poisonSlime = PoisonSlime('A');

      // 5번 공격하여 poisonCount를 0으로 만든다
      for (int i = 0; i < 5; i++) {
        poisonSlime.attack(hero);
      }
      // 5번 모두 진행 시 체력 24
      expect(hero.hp, equals(24));

      // poisonCount가 0일 때 추가 공격 시 독 공격이 적용되지 않아야 하니 10만 감소
      poisonSlime.attack(hero);
      expect(hero.hp, equals(14));

    });
  });
}
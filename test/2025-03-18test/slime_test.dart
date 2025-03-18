import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';
import 'package:modu_3_dart_study/PR2025-03-18/slime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime Test', () {
    test('용사의 기본 체력 확인 test', () {
      final hero = Hero(name: '팔라딘', hp: 50);
      expect(hero.hp, isNot(greaterThanOrEqualTo(51)));
    });
    test('용사의 기본 체력 확인 test', () {
      final hero = Hero(name: '팔라딘', hp: 50);
      expect(hero.hp, isNot(lessThanOrEqualTo(-1)));
    });
    test('슬라임 공격 후 용사의 체력 감소 test', () {
      final hero = Hero(name: '팔라딘', hp: 50);
      PoisonSlime poisonSlime = PoisonSlime("독슬라임");
      poisonSlime.attack(hero);
      expect(hero.hp, isNot(equals(50)));
    });
    test('독슬라임 생성이 잘 되었는지 확인 test', () {
      final hero = Hero(name: '팔라딘', hp: 50);
      PoisonSlime poisonSlime = PoisonSlime("독슬라임");
      expect(poisonSlime.suffix, equals("독슬라임"));
    });
    test('독슬라임 공격시 poisonCount 감소 확인 test', () {
      final hero = Hero(name: '팔라딘', hp: 50);
      PoisonSlime poisonSlime = PoisonSlime("독슬라임");
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonCount, lessThanOrEqualTo(4));
    });
  });
}

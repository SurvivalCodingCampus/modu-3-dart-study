import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/poisonSlime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';


void main(){
  group('PoisonSlime 클래스를 작성', () {
    test('PoisonSlime 클래스를 생성', () {
      PoisonSlime poisonSlime = PoisonSlime('A');

      expect( poisonSlime, isA<PoisonSlime>());
      expect( poisonSlime.suffix,  equals('A'));
    });

    test('PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다', () {
      PoisonSlime poisonSlime = PoisonSlime('A');

      expect( poisonSlime.poisonCount, equals(5));
    });

    test('attack() 메소드가 호출되면 다음 내용의 공격을 한다', () {
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero('Hero', 50);

      poisonSlime.attack(hero);

      expect(hero, isA<Hero>());
      expect(hero.name, equals('Hero'));
      expect(hero.hp, equals(32));
      //poisonCount 를 1 감소
      expect(poisonSlime.poisonCount, equals(4));
    });
  });
}
import 'package:modu_3_dart_study/assignments/2025-03-18/src/solution/hero.dart';
import 'package:modu_3_dart_study/assignments/2025-03-18/src/solution/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard 테스트 - 초기값', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50);
    test('성공', () {
      // then
      expect(wizard.name, equals('마법사'));
      expect(wizard.hp, equals(50));
      expect(wizard.mp, equals(100)); // mp = 100 초기화
    });

    test('실패', () {
      // then
      expect(wizard.name, equals('마법'));
      expect(wizard.hp, equals(100));
      expect(wizard.mp, equals(50)); // mp = 100 초기화
    });
  });

  group('Wizard 테스트 - heal', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50);
    Hero hero = Hero(name: '홍길동', hp: 50);
    test('성공', () {
      // when
      wizard.heal(hero: hero);

      // then
      expect(wizard.mp, equals(90));
      expect(hero.hp, equals(70));
    });

    test('mp값 부족', () {
      wizard.mp = 9;
      // when
      wizard.heal(hero: hero);

      // then
      expect(wizard.mp, equals(9)); // mp 부족 시 힐 불가능. mp 감소 없음
      expect(hero.hp, equals(50)); // hero의 hp도 증가 없음.
    });

    test('실패 - mp값 미차감', () {
      // when
      wizard.heal(hero: hero);

      // then
      expect(wizard.mp, equals(100)); // 힐 성공 시 mp값은 10만큼 감소
      expect(hero.hp, equals(70));
    });

    test('실패 - hero의 hp값 미회복', () {
      // when
      wizard.heal(hero: hero);

      // then
      expect(wizard.mp, equals(90));
      expect(hero.hp, equals(50)); // 힐 성공 시 hp값은 20만큼 증가
    });
  });
}

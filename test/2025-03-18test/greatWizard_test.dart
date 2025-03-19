import 'package:modu_3_dart_study/PR2025-03-18/greatWizard.dart';
import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';
import 'package:test/test.dart';

void main() {
  group('GreatWizard 생성 Test', () {
    test('GreatWizard 생성시 초기마나 확인 test', () {
      //given
      final greatWizard = GreatWizard(name: '대마법사', hp: 10, mp: 150);
      //when
      //then
      expect(greatWizard.mp, equals(150));
    });
    test('greatWizard생성시 이름 확인 test', () {
      //given
      final greatWizard = GreatWizard(name: '대마법사', hp: 10, mp: 150);
      //when
      //then
      expect(greatWizard.name, equals("대마법사"));
    });
  });
  group('Hero 생성 Test', () {
    test('Hero 이름 생성 확인 test', () {
      //given
      final hero = Hero(name: '팔라딘', hp: 30);
      //when
      //then
      expect(hero.name, equals('팔라딘'));
    });
    test('Hero hp 생성 확인 test', () {
      //given
      final hero = Hero(name: '팔라딘', hp: 30);
      //when
      //then
      expect(hero.hp, equals(30));
    });
  });
  group('Wizard superHeal 메서드 Test', () {
    test('heal시 hero의 hp max로 확인 test', () {
      //given
      final greatWizard = GreatWizard(name: '대마법사', hp: 10, mp: 150);
      final hero = Hero(name: '팔라딘', hp: 30);
      double initialHp = hero.hp;
      //when
      greatWizard.superHeal(hero);
      //then
      expect(hero.hp, equals(hero.maxHp));
    });
    test('heal시 wizard의 mp 10 소모 확인 test', () {
      //given
      final greatWizard = GreatWizard(name: '대마법사', hp: 10, mp: 150);
      final hero = Hero(name: '팔라딘', hp: 30);
      int initialMp = greatWizard.mp;
      //when
      greatWizard.superHeal(hero);
      //then
      expect(greatWizard.mp, equals(initialMp - 50));
    });
    test('superHeal 시 wizard의 mp가 0일 때 마나가 부족합니다 출력', () {
      // given
      final greatWizard = GreatWizard(name: '대마법사', hp: 10, mp: 150);
      final hero = Hero(name: '팔라딘', hp: 30);
      // when
      for (int i = 0; i < 4; i++) {
        greatWizard.superHeal(hero);
      }
      // then
      //마나가 0인상태로 superHeal을 해도 마나가 음수로 가지 않음
      expect(greatWizard.mp, equals(0));
    });
  });
}

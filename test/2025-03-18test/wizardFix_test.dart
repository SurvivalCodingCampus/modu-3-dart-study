import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';
import 'package:modu_3_dart_study/PR2025-03-18/wizardFix.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard 생성 Test', () {
    test('Wizard 이름 생성 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      //when
      //then
      expect(wizard.name, equals('견습마법사'));
    });
    test('Wizard hp 생성 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      //when
      //then
      expect(wizard.hp, equals(10));
    });
    test('Wizard mp지정 안하면 initialMp 할당 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      //when
      //then
      expect(wizard.mp, equals(100));
    });
    test('Wizard mp지정시 mp 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      //when
      //then
      expect(wizard.mp, equals(100));
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
  group('Wizard heal 메서드 Test', () {
    test('heal시 hero의 hp 20 증가 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      final hero = Hero(name: '팔라딘', hp: 30);
      double initialHp = hero.hp;
      //when
      wizard.heal(hero);
      //then
      expect(hero.hp, equals(initialHp + 20));
    });
    test('heal시 wizard의 mp 10 소모 확인 test', () {
      //given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      final hero = Hero(name: '팔라딘', hp: 30);
      int initialMp = wizard.mp;
      //when
      wizard.heal(hero);
      //then
      expect(wizard.mp, equals(initialMp - 10));
    });
    test('heal 시 wizard의 mp가 0일 때 HP 증가 안 함', () {
      // given
      final wizard = Wizard(name: '견습마법사', hp: 10);
      final hero = Hero(name: '팔라딘', hp: 30);
      // when
      for (int i = 0; i < 11; i++) {
        wizard.heal(hero);
      }
      // then
      //마나가 0인상태로 heal을 해도 마나가 음수로 가지 않음
      expect(wizard.mp, equals(0));
    });
  });
}

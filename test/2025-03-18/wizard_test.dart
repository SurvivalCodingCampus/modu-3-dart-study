import 'dart:math';

import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard 테스트', (){
    test('Wizard 생성', () {
      final Wizard wizard = Wizard(name: '마법사', hp: 50);

      expect(wizard.mp, equals(Wizard.wizardMaxMP));
      expect(wizard.name, equals('마법사'));
      expect(wizard.hp, equals(50));
    });
    test('heal. Hero의 hp를 20 회복시키고 Wizard의 mp를 10 소모', () {
      final Hero hero = Hero(name: '용사', hp: 50);
      final Wizard wizard = Wizard(name: '마법사', hp: 50);

      wizard.heal(hero);

      expect(wizard.mp, equals(Wizard.wizardMaxMP - 10));
      expect(hero.hp, equals(50 + 20));
    });
    test('mp가 부족하면 "마나가 부족합니다" 출력', () {
      final Hero hero = Hero(name: '용사', hp: 50);
      final Wizard wizard = Wizard(name: '마법사', hp: 50);

      wizard.mp = 9;
      wizard.heal(hero);

      expect(wizard.mp, equals(9));
      expect(hero.hp, equals(50));
    });
  });
}

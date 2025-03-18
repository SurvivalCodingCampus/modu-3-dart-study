import 'dart:math';

import 'package:modu_3_dart_study/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  group('GreatWizard', (){
    test('GreatWizard 생성', () {
      final GreatWizard greatWizard = GreatWizard(name: '대마법사', hp: 50);

      expect(greatWizard.mp, equals(GreatWizard.greatWizardMaxMP));
      expect(greatWizard.name, equals('대마법사'));
      expect(greatWizard.hp, equals(50));
    });
  });
  test('superHeal. Hero의 hp를 전부 회복시키고 GreatWizard mp를 50 소모', () {
    final Hero hero = Hero(name: '용사', hp: 50);
    final GreatWizard greatWizard = GreatWizard(name: '대마법사', hp: 50);

    greatWizard.superHeal(hero);

    expect(greatWizard.mp, equals(GreatWizard.greatWizardMaxMP - 50));
    expect(hero.hp, equals(Hero.heroMaxHP));
  });
  test('mp가 부족하면 "마나가 부족합니다" 출력', () {
    final Hero hero = Hero(name: '용사', hp: 50);
    final GreatWizard greatWizard = GreatWizard(name: '대마법사', hp: 50);

    greatWizard.mp = 49;
    greatWizard.superHeal(hero);

    expect(greatWizard.mp, equals(49));
    expect(hero.hp, equals(50));
  });
}

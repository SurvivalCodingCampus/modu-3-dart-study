import 'package:modu_3_dart_study/2025-03-18/greatWizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('GreatWizard', () {
    test('mp가 150으로 증가', () {
      GreatWizard greatWizard = GreatWizard(name: 'GreatWizard', hp: 100);

      expect(greatWizard.mp, equals(150));
    });

    test('uperHeal(hero: Hero): Unit의 hp를 전부 회복시키고 자신의 mp를 50 소모', () {
      GreatWizard greatWizard = GreatWizard(name: 'GreatWizard', hp: 100);
      Hero hero = Hero('Hero', 50);

      greatWizard.superHeal(hero);

      expect(greatWizard.mp, equals(100));
      expect(hero.hp, equals(hero.maxHP));
    });

  });
}
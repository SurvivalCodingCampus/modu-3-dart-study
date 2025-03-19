import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wizard', () {
    test('mp: Int (초기값 100)', () {
      Wizard wizard = Wizard('Wizard', 50);

      expect(wizard.mp, equals(100));
    });

    test('heal: Unit의 hp를 20 회복시키고 자신의 mp를 10 소모', () {
      Wizard wizard = Wizard('Wizard', 50);
      Hero hero = Hero('Hero', 50);

      wizard.heal(hero);

      expect(wizard.mp, equals(90));
      expect(hero.hp, equals(70));
    });

  });
}
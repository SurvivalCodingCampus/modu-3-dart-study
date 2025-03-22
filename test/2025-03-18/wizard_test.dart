import 'package:modu_3_dart_study/game/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:test/test.dart';

void main() {
  Hero hero = Hero(100);
  Wand wand = Wand(name: '지팡이', power: 99.9);
  Wizard wizard = Wizard(name: '마법사', hp: 100);
  wizard.grab(wand);

  group('wizard', () {
    test('wizard', () {
      expect(wizard.mp, equals(100));
    });

    test('heal', () {
      int wizardMp = wizard.mp;
      for (int i = 1; i <= 10; i++) {
        wizard.heal(hero);
        int countMp = wizard.mp;
        expect(countMp, equals(wizardMp - 10 * i));
        print('Heal $i: mp = $countMp');
      }
    });
  });
}

import 'package:modu_3_dart_study/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/game/hero.dart';
import 'package:test/test.dart';

void main() {
  Hero hero = Hero(100);
  GreatWizard greatWizard = GreatWizard(name: '물리법사', hp: 100, wand: null);

  group('great wizard', () {
    test('great wizard', () {
      expect(greatWizard.mp, equals(150));
    });

    test('super heal', () {
      int initialMp = greatWizard.mp;

      for (int i = 1; i <= 3; i++) {
        greatWizard.heal(hero);
        int countMp = greatWizard.mp;
        expect(countMp, equals(initialMp - 50 * i ));
        print('Heal $i: mp = $countMp');
      }
    });
  });
}

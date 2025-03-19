import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-18/greatWizard.dart';
import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  group('magician', () {
    test('heal', () {
      Hero hero = Hero(name: "야무치", hp: 50);
      Magician magician = Magician(name: "피콜로");
      print('테스트 시작');
      magician.heal(hero);
      print('테스트 끝');
      expect(hero.hp, equals(70));
      expect(magician.mp, equals(90));
    });

    test('heal2', () {
      Hero hero = Hero(name: "야무치", hp: 50);
      Magician magician = Magician(name: "피콜로");

      magician.mp = 5;
      magician.heal(hero);

      expect(magician.mp, equals(5));
    });

    test('superHeal', () {
      Hero hero = Hero(name: "야무치", hp: 50);
      GreatWizard greatWizard = GreatWizard(name: "피콜로");

      greatWizard.superHeal(hero);

      expect(hero.hp, equals(Hero.maxHp));
      expect(greatWizard.mp, equals(100));
    });

    test('superHeal2', () {
      Hero hero = Hero(name: "야무치", hp: 50);
      GreatWizard greatWizard = GreatWizard(name: "피콜로");

      greatWizard.mp = 49;
      greatWizard.superHeal(hero);

      expect(hero.hp, equals(50));
      expect(greatWizard.mp, equals(49));
    });
  });
}

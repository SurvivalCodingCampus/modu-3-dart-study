import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  group("great wizard heal test", () {
    final greatWizard = GreatWizard();
    final hero = Hero("용사", 10);
    test(("Wizard heal print Test"), () {
      greatWizard.superHeal(hero);

      expect(hero.hp, Hero.maxHp);
    });

    test(("Wizard heal mp oring Test"), () {
      greatWizard.mp = 0;
      greatWizard.superHeal(hero);

      expect(hero.hp, Hero.maxHp);
    });
  });
}

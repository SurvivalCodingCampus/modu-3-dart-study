import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  group("wizard heal test", () {
    final wizard = Wizard();
    final hero = Hero("용사", 50);
    test(("Wizard heal print Test"), () {
      wizard.heal(hero);

      expect(hero.hp, 70);
    });

    test(("Wizard heal mp oring Test"), () {
      wizard.mp = 0;
      wizard.heal(hero);

      expect(hero.hp, 70);
    });
  });
}

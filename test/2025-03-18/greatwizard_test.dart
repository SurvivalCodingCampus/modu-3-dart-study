import 'package:test/test.dart';
import '../../assignments/2025-03-18/great_wizard.dart';
import '../../assignments/2025-03-17/encapsulation.dart';
import '../../assignments/2025-03-18/hero.dart';

void main() {
  Hero hero = Hero("전사", 50, 200);
  Wand wand = Wand(100.0);

  GreatWizard greatWizard = GreatWizard(
    name: "대마법사",
    mp: 150,
    hp: 100,
    wand: wand,
    power: 100,
  );

  greatWizard.superHeal(hero);

  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);

  greatWizard.superHeal(hero);

  print("대마법사의 남은 power: ${greatWizard.power}");
}

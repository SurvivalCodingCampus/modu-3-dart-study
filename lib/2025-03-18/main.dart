import 'package:modu_3_dart_study/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/posion_Slime.dart';
import '../2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/super_hero.dart';

void main(List<String> arguments) {
  final hero = Hero(name: '홍길동', hp: 100);
  hero.run();
  final superHero = SuperHero(name: '한석봉', hp: 50);
  superHero.run();

  final PoisonSlime poisonSlime = PoisonSlime('A');
  poisonSlime.attack(hero);

  //Wizard wizard = Wizard(name: '산신령', hp: 100 ,mp: 100);

  //wizard.heal(hero);
  //wizard.heal(hero);
  //wizard.heal(hero);

  GreatWizard greatWizard = GreatWizard(name: '크레이트산신령', hp: 100);

  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);

}

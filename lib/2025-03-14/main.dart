import 'package:modu_3_dart_study/game/wizard.dart';

import '../game/hero.dart';

void main() {
  final sword = Sword(name: '불꽃의 검', damage: 5);

  final hero1 = Hero(name: '슈퍼맨', hp: 100);
  final hero2 = Hero(name: '배트맨', hp: 100);

  final wizard = Wizard(name: '마법사', hp: 50);

  wizard.heal(hero1);
  wizard.heal(hero2);

  hero1.sword = sword;
}



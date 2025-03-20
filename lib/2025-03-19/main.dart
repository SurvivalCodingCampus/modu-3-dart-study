import 'package:modu_3_dart_study/2025-03-19/character.dart';
import 'package:modu_3_dart_study/2025-03-19/hero.dart';
import 'package:modu_3_dart_study/2025-03-19/slime.dart';
import 'package:modu_3_dart_study/2025-03-19/wizard.dart';

void main() {
  // Character character = Character('홍길동',100);
  Wizard wizard = Wizard(name: '마법사', hp: 100);
  Hero hero = Hero(name: 'hero', hp: 100);
  Slime slime = Slime(name: '슬라임', hp: 100);
  wizard.heal(hero);
  wizard.attack(slime);
}

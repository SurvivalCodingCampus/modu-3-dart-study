import 'package:modu_3_dart_study/PR2025-03-17/wand.dart';

class Wizard {
  String name;
  int hp;
  int mp;
  Wand? wand;

  Wizard(this.name, this.hp, this.mp, {this.wand});
}

void main() {
  Wand woodWand = Wand(name: "팡이", power: 30);
  Wand waterWand = Wand(name: "물지팡이", power: 10);
}

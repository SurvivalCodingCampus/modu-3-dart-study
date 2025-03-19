import 'package:modu_3_dart_study/2025-03-18/hero.dart';

void main() {
  Wand wand = Wand(name: '지팡이', power: 99.9);
  Wizard wizard = Wizard(name: '마법사', hp: 100);
  wizard.grab(wand);
}

class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});
}

class Wizard {
  int mp = 100;
  String name;
  int hp;
  Wand? _wand;

  Wizard({required this.name, required this.hp, Wand? wand}) : _wand = wand;

  void heal(Hero hero) {
    if (mp >= 10) {
      hero.hp += 20;
      mp -= 10;
      print('힐을 시전 했습니다. 대상 HP:${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }

  set wand(Wand value) => _wand = value;

  void grab(Wand wand) {
    print('$name는 ${wand.name}를 들 수 있습니다.');
  }
}

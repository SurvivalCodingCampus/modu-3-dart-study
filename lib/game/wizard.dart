import 'hero.dart';

class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});
}

class Wizard {
  String name;
  int hp;
  Wand? _wand;

  Wizard({required this.name, required this.hp, Wand? wand}) : _wand = wand;

  set wand(Wand value) => _wand = value;

  void heal(Hero hero){
    hero.hp += 10;
    print('${hero.name}의 hp를 10 회복 했습니다.');
  }

  void grab(Wand wand) {
    print('$name는 ${wand.name}를 들 수 있습니다.');
  }
}
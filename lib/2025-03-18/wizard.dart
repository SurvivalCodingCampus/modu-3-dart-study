class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});
}

class Wizard {
  final int mp = 100;
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

// void main() {
//   Wand wand = Wand(name: '지팡이', power: 99.9);
//   Wizard wizard = Wizard('마법사', 100, wand);
//   wizard.grab(wand);
// }
//
// class Wand {
//   String name;
//   double power;
//
//   Wand({required this.name, required this.power});
// }
//
// class Wizard {
//   String name;
//   int hp;
//   Wand? wand;
//
//   Wizard(this.name, this.hp, this.wand);
//
//   void grab(Wand wand) {
//     print('$name는 ${wand.name}를 들 수 있습니다.');
//   }
// }

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
  String name;
  int hp;
  Wand? _wand;

  Wizard({required this.name, required this.hp, Wand? wand}) : _wand = wand;

  set wand(Wand value) => _wand = value;

  void grab(Wand wand) {
    print('$name는 ${wand.name}를 들 수 있습니다.');
  }
}

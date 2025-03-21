abstract class Character {
  String name;

  Character({required this.name});
}

class Hero extends Character {
  int hp;

  Hero({required super.name, required this.hp});
}

class Sword extends Character {
  int fixHp;

  Sword({required super.name, required this.fixHp});
}

abstract interface class Human {
  void speak();
}

class Dancer implements Human {
  String name;
  int hp;

  Dancer(this.name, this.hp);

  @override
  void speak() {
    // TODO: implement speak
    print('가수가 노래합니다.');
  }
}

class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});
}



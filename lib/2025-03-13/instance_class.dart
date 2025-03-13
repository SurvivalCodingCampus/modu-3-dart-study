import 'dart:math';

void main() {}

//PascalCase
class Hero {
  String name;
  int hp;

  //생성자
  Hero(this.name, this.hp);

  //메소드
  void attack() {}

  void run() {}

  void sleep() {}
}

class Slime {
  int hp;
  final int level = 10;

  Slime(this.hp);
}


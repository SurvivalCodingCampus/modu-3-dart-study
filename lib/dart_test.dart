// void main() {
//   final hero1 = Hero(name: '홍길동', hp: 100);
//   final hero2 = hero1;
//
//   hero2.hp = 200;
//
//   print(hero1.hp);
// }
//
// class Hero {
//   String name;
//   int hp;
//
//   Hero({required this.name, required this.hp});
// }

import 'dart:math';

void main() {

  Hero hero = Hero('홍길동', 30);
  print(Hero.money);
}

int heroMoney = 100;

class Hero {
  static int money = 100;
  String name;
  int hp;

  Hero(this.name, this.hp);

  static void setRandomMoney() {
    money = Random().nextInt(1000);
  }
}

// // void main (){
// //   static String name;
// }

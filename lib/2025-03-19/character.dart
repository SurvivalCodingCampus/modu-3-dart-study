import 'package:modu_3_dart_study/2025-03-19/slime.dart';

// class Character {
//   String name;
//   int hp;
//
//   Character(this.name, this.hp);
//
//   void run() {
//     print('$name이 도망쳤다.');
//   }
//
//   void attack(Slime slime) {
//     print('$name이 공격했다.');
//     // Slime.hp -= 10;
//     print('적에게 ??의 데미지를 입혔다.');
//   }
// }

abstract class Character {
  String name;
  int hp;

  // Character(this.name, this.hp);
  Character({required this.name, required this.hp});

  void run() {
    print('$name이 도망쳤다.');
  }

  void attack(Slime slime) {}
}

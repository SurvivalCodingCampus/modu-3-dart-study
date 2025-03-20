import 'package:modu_3_dart_study/2025-03-19/character.dart';
import 'package:modu_3_dart_study/2025-03-19/human.dart';
import 'package:modu_3_dart_study/2025-03-19/slime.dart';

// class Hero extends Character {
//   Hero(super.name, super.hp);
//
//   @override
//   void attack(Slime slime) {
//     super.attack(slime);
//     print('$name이 $slime을 공격했다.');
//     print('10의 데미지');
//     slime.hp -= 10;
//   }
// }


class Hero extends Character implements Attackable {
  String name;
  int hp;

  // Hero(this.name, this.hp);
  Hero({required this.name, required this.hp}) : super(name: name, hp: hp);

  @override
  void attack(Slime slime) {
    // TODO: implement attack
    super.attack(slime);
    print('$name이 $slime을 공격했다.');
    print('10의 데미지');
    slime.hp -= 10;
  }
}

// void main() {
//   Hero hero = Hero('hero');
//   Slime slime = Slime(name: 'slime', hp: 100);
//   hero.attack(slime);
// }
//
// class Hero implements Attackable,Moveable {
//   final String name;
//   int hp = 100;
//
//   Hero(this.name);
//
//   @override
//   void attack(Slime target) {
//     print('$name의 물리 공격!');
//     target.hp -= 10;
//     print('${target.name}에게 10의 데미지! (남은 HP: ${target.hp})');
//   }
//   @override
//   void move(Hero target) {
//   }
// }

// import 'package:modu_3_dart_study/2025-03-18/slime.dart';
//
// class PoisonSlime extends Slime {
//   PoisonSlime({required String suffix}) : super(suffix);
//
//   int _poisonCount = 5;
//
//   int get poisonCount => _poisonCount;
//
//   @override
//   void attack() {
//     super.attack(Hero hero);
//     if (_poisonCount > 0) {
//       print('추가로, 독 포자를 살포했다!');
//       int doubleHp = (hero.hp * 0.2).toInt();
//       hero.hp = hero.hp - doubleHp;
//       print('$doubleHp포인트의 데미지');
//       _poisonCount -= 1;
//     }
//   }
// }
//
// void main() {
//   Hero hero = Hero(100);
//   PoisonSlime poisonSlime = PoisonSlime(suffix: 'A');
//   poisonSlime.attack(hero);
// }

import 'package:modu_3_dart_study/2025-03-14/sword.dart';

class NewHero {
  String name;
  int hp;
  Sword? sword;

  NewHero({required this.name, required this.hp, this.sword});

  void attack() {
    print('공격했습니다.');
  }
}

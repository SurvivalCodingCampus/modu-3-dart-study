import 'package:modu_3_dart_study/2025-03-14/hero.dart';

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격했다');
    hero.receiveDamage(10);
  }
}

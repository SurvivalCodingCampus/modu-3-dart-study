import 'hero.dart';

class Slime {
  static const int attackDamage = 10;
  static String damageMsg(int damage) => '$damage의 데미지';
  static String attackMsg(String suffix) => '슬라임$suffix이/가 공격했다';

  final String suffix;
  int hp = 50;

  Slime(this.suffix);

  void attack(Hero hero) {
    print(attackMsg(suffix));
    print(damageMsg(attackDamage));
    hero.hp -= attackDamage;
  }
}

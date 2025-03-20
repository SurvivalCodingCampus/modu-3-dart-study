import 'hero.dart';

class Slime {
  final _name = '슬라임';
  int _hp = 50;
  final int baseDamage = 10;
  final String suffix;

  Slime(this.suffix);

  int get hp => _hp;

  String get name => '$_name $suffix';

  set hp(int value) {
    if (value <= 0) {
      value = 0;
    }
    _hp = value;
  }

  void attack(Hero hero) {
    print('$name 이/가 공격했다.');
    print('$baseDamage의 데미지');
    hero.hp -= baseDamage;
  }
}

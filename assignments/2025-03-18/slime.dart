import 'hero.dart';

class Slime {
  static const defaultDamage = 10;
  static const int minHp = 0;
  static const defaultHp = 50;
  int _hp = Slime.defaultHp;
  final String _suffix;

  Slime(this._suffix);

  int get hp => _hp;
  set hp(int value) {
    if (value < Slime.minHp) {
      _hp = Slime.minHp;
      return;
    }

    _hp = value;
  }

  String get suffix => _suffix;

  void attack(Hero hero) {
    print('슬라임$_suffix이/가 공격했다.');
    print('${Slime.defaultDamage}의 데미지');
    hero.hp -= Slime.defaultDamage;
  }
}

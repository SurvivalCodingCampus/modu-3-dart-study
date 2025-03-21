import 'task_exception.dart';
import 'wand.dart';
import '../2025-03-18/hero.dart';
import 'dart:math';

class Wizard {
  static const healMpCost = 10;
  static const healAmount = 20;
  static const noMpMsg = '마나가 부족합니다';
  static const maxMp = 100;

  static casingHealMsg(int hp) => '힐을 시전했습니다. 대상 HP: $hp';

  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = max(0, value);
  }

  int get mp => _mp;

  set mp(int value) {
    _validateMp(value);
    _mp = value;
  }

  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (value == null) {
      throw TaskException.invalidWand;
    } else {
      _wand = value;
    }
  }

  Wizard(String name, int hp, {int mp = maxMp, Wand? wand})
    : _name = name,
      _hp = max(0, hp),
      _mp = mp,
      _wand = wand {
    _validateName(name);
  }

  void heal(Hero hero) {
    if (mp < healMpCost) {
      print(noMpMsg);
    } else {
      hero.receiveHealing(healAmount);
      mp -= healMpCost;
      print(casingHealMsg(hero.hp));
    }
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw TaskException.invalidName;
    }
  }

  void _validateMp(int mp) {
    if (mp < 0) {
      throw TaskException.invalidMp;
    }
  }
}

main() {}

import 'hero.dart';
import 'wand.dart';

class Wizard extends Hero {
  Wand? _wand;

  Wizard(super.name);

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('완드는 null으로 수정할 수 없습니다.');
    }

    _wand = wand;
  }

  Wand? get wand => _wand;

  void heal(Hero target) {
    const int mpCost = 10;
    const int hpRecovery = 20;

    if (mp >= mpCost) {
      target.hp += hpRecovery;
      mp -= mpCost;
    }
  }
}

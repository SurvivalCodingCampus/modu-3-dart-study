import 'hero.dart';

class Slime {
  static const int ap = 10;

  final String suffix;

  Slime(this.suffix);

  void attack(Hero target) {
    target.hp -= ap;
  }
}

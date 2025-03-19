import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}) {
    print('2번');
  }

  @override
  void run() {
    super.run();
    print('멋지게 뛰었다');
  }

  @override
  void attack(Slime slime) {

  }
}

void main() {
  final superHero = SuperHero(name: 'name', hp: 0);
  superHero.run();
}
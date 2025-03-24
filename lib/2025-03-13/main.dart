import 'package:modu_3_dart_study/game/hero.dart';
import 'package:modu_3_dart_study/game/slime.dart';

void main() {
  Hero hero = Hero(name: '용사', hp: 100);

  hero.attack();
  hero.run();
  hero.sleep();

  Slime slime1 = Slime(50, 'A');
  Slime slime2 = Slime(48, 'B');

  slime1.run();
  slime2.run();

  bool isEven(int number) {
    return number % 2 == 0;
  }
}

class MyClass {
  bool isEven(int number) {
    return number % 2 == 0;
  }
}

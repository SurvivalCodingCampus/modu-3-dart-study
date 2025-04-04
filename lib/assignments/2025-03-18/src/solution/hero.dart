// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'slime.dart';

class Hero {
  String name;
  int hp;
  static const int maxHp = 100;

  Hero({required this.name, this.hp = maxHp});

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다');
    hp -= 10;
  }

  void run() {
    print('$name이 도망쳤다');
  }
}

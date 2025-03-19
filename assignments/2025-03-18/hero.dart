import '../../assignments/2025-03-18/sword.dart';
import '../../assignments/2025-03-18/slime.dart';

class Hero {
  static const _fullHp = 100; //

  String name = '';
  int hp = 0;
  Sword? sword;

  //명시적 생성자 추가
  Hero({required this.name, required this.hp, this.sword}) {
    print('Hero 클래스의 인스턴스를 생성했습니다.');
  }

  static get fullHp => _fullHp;

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다.');
    hp -= 10;
  }

  void run() {
    print('$name이 도망쳤다.');
  }


}

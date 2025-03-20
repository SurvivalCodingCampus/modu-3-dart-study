import 'package:modu_3_dart_study/2025-03-14/slime.dart';
import 'package:modu_3_dart_study/2025-03-14/sword.dart';
import 'package:modu_3_dart_study/2025-03-19/attackable.dart';

class Hero implements Attackable {
  // -------------------------* 필드 *-------------------------
  static int mp = 100;
  final String name;
  int hp;
  Sword? sword;
  static const int maxHp = 50;

  // -------------------------* 생성자 *-------------------------

  Hero({required this.name, required this.hp, this.sword}) {
    print('$name(용사)가 생성되었다. HP: $hp');
  }
  // -------------------------* 메서드 *-------------------------
  // Attackable 상속 오버라이드
  @override
  void attack(Slime slime) {
    print('나 공격한다!!');
  }

  void receiveDamage(int demage) {
    print('$demage 의 데미지');
    hp -= demage;
    if (hp <= 0) {
      hp = 0;
      print('[죽음]$name의 HP가 $hp 되어 죽었다 ㅃ2');
    } else {
      print('[공격]으로 $name의 HP가 $hp 되었다.');
    }
  }

  void run() {
    print('$name(용사)이/가 도망간다. 낄낄');
  }

  void sleep() {
    hp = 100;
    print('[회복]$name(용사)이/가 잠자서 HP가 $hp로 회복이 되었다.');
  }
}

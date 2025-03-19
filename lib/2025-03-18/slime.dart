import '../2025-03-18/hero.dart';

class Slime {
  int hp = 50;
  final String suffix;
  static final int slimeAttackPoint = 10;

  Slime (this.suffix){
    print('Slime 클래스의 인스턴스를 생성했습니다.');
  }

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= slimeAttackPoint;
  }
}
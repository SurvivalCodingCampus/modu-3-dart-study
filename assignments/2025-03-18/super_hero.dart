import '../../assignments/2025-03-18/slime.dart';
import '../../assignments/2025-03-18/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}){

    print('SuperHero 클래스의 인스턴스를 생성했습니다.');
  }

  bool _isFlying = false;

  // _isFlying getter, setter.
  bool get isFlying => _isFlying;

  set isFlying(bool value) {
    _isFlying = value;
    if (value) {
      print('$name이 날개를 펼쳤다.');
    } else {
      print('$name이 날개를 접었다.');
    }
  }

  //SuperHero 추가 사양
  @override
  void attack (Slime slime) {
    super.attack(slime);

    if (isFlying) {
      print ('$name이 $slime을 공격했다.');
      slime.hp -= 5;
      print ('5포인트의 추가 피해를 입혔다.');
    }
  }
}

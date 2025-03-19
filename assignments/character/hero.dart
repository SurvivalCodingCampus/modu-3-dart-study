import 'slime.dart';

class Hero {
  final String name;
  int hp;
  static const int maxHp = 150;

  Hero(this.name, this.hp);

  void attack(Slime slime) {
    print('$name 이 $slime을 공격했다!');
    hp -= 10;
  }

  void run() {
    print('$name 은 도망쳤다! ');
  }
}

class SuperHero extends Hero {
  SuperHero(super.name, super.hp);

  bool _isFlying = false;

  bool get isFlying => _isFlying;

  set isFlying(bool value) {
    _isFlying = value;
    if (value) {
      print('$name 이 날개를 펼쳤다.');
    } else {
      print('$name 이 날개를 접었다.');
    }
  }

  @override
  void run() {
    print('$name 이 퇴각했다.');
  }

  void attack(Slime slime) {
    super.attack(slime);

    if (isFlying) {
      print('$name이 $slime 을 공격했다.');
      slime.hp -= 5;
      print('5포인트의 추가 피해를 입혔다.');
    }
  }
}

void main() {
  final hero = Hero('아이언맨', 100);
  hero.run();

  final superhero = SuperHero('스파이더맨', 150);
  superhero.run();
}

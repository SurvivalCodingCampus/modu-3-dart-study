import '../2025-03-14/class.dart';

import 'sword.dart';

void main() {
  print(Hero.money);

  Hero hero = Hero(hp: 100, name: '홍길동');

  Sword sword = Sword(name: '불의 검', damage: 10);
  Hero hero2 = Hero(hp: 100, name: '홍길동', sword: sword);
}

// PascalCase
class Hero {
  // 정적인 변수
  static int money = 100;
  final int maxHp = 150;   // Greatwizard를 위해 생성

  String name; // non-nullable
  int _hp;
  Sword? sword; // nullable

  // named parameter
  Hero({required this.name, required int hp, this.sword}) : _hp = hp >= 0 ? hp : 0;

  int get hp => _hp;

  set hp(int value) {
    _hp = value >= 0 ? value : 0;  // 음수일 경우 0으로 설정
  }
  
  // 메서드
  void attack() {
    _hp -= 5;
    print(topLevelName);
  }

  static void run() {
    Hero.money = 200;
    Hero hero = Hero(name: 'name', hp: 100);
    hero.name;
  }

  void sleep() {
    _hp = 100;
    print('$name 이 잠을잤다');
  }
}
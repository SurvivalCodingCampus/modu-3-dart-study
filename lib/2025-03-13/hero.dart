import 'dart:math';

// PascalCase
class Hero {
  String name;
  int hp;

  // 생성자
  Hero(this.name, this.hp);

  // 메서드
  void attack() {
    hp -= 5;
  }

  void run() {}

  void sleep() {
    hp = 100;
    print('$name 이 잠을잤다');
  }
}

// void main() {
//   int i = 10;
//   // 인스턴스 생성
//   Hero hero = Hero('홍길동', 100);
//   hero.attack();
//
//   print(hero.name);
//
//   hero.hp = 50;
//
//   print(hero.hp);
//
//   final Random random = Random();
//   final int randomNumber = random.nextInt(10); // 0 ~ 9
//   print(randomNumber);
// }

// 순수 함수
int function1(int x) {
  return x * 2;
}

class Hero {
  String name;
  int hp;
  static const int maxHp = 50;

  // 생성자
  Hero(this.name, {this.hp = maxHp});

  // 메서드
  // void attack() {
  //   hp -= 5;
  // }

  // void run() {}
  //
  // void sleep() {
  //   hp = 100;
  //   print('$name 이 잠을잤다');
  // }
}
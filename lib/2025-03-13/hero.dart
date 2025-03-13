class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack() {}

  void run() {}

  void sit(int sec) {}

  void slip() {}

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자 회복했다.');
  }
}

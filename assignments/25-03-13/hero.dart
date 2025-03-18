class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack() {
    print('$name 은 공격했다!');
  }

  void run() {
    print('$name 은 도망쳤다! ');
  }

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다!');
  }
}


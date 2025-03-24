class Sword {
  String name;
  int damage;

  Sword({required this.name, required this.damage});
}

class Hero {
  String name;
  int hp;
  Sword? sword;

  Hero({required this.name, required this.hp, this.sword});

  void attack() {
    print('$name is attacking');
  }

  void run() {
    print('$name is running away');
  }

  void sit(int sec) {
    print('$name is sitting $sec second');
  }

  void slip() {
    print('$name slipped and fell');
  }

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다.');
  }
}

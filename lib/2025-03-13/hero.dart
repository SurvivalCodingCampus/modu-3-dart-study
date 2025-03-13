class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack() {
    print('$name is attacking!');
  }

  void run() {
    print('$name is running away!');
  }

  void sit(int sec) {
    print('$name is sitting for $sec seconds.');
  }

  void slip() {
    print('$name is slipped and fell!');
  }

  void sleep() {
    print('$name is attacking!');
  }
}

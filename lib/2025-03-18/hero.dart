class Hero {
  String name;
  int hp;
  final int maxHp = 150;

  Hero({required String name, required int hp}) : name = name, hp = hp {
    if (hp > maxHp) {
      hp = maxHp;
    }
    print("$name 이라는 이름과 $hp HP를 가진 Hero가 생성되었다!");
  }
}

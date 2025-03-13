// 연습 문제 1
class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.hp, this.mp, this.name);

  // 연습 문제 2
  void selfAid() {
    mp -= 5;
    hp = maxHp;
  }
}

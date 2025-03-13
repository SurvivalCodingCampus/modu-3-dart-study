class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;
  final String name;

  int hp;
  int mp;

  Cleric(this.name, this.hp, this.mp) {
    hp = (hp > maxHp) ? maxHp : hp;
    mp = (mp > maxMp) ? maxMp : mp;
  }
}

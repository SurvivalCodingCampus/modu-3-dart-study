class Cleric {
  String name;
  int? hp;
  int? mp;

  //static const를 활용해 maxHp,maxMp 공유
  static const int maxHp = 50;
  static const int maxMp = 10;

  //Cleric({required this.name, this.hp = maxHp, this.mp = maxMp});
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});
}

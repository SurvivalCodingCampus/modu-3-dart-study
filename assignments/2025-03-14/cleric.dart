class Cleric {
  final String name;
  int? hp;
  int? mp;
  static int maxHp = 50;
  static int maxMp = 10;

  // instance 가 존재하기 전부터 static 은 존재하는 것을 활용해
  // 생성자에 값이 안 들어올 때 static 값 투입
  Cleric(this.name, {this.hp, this.mp}) {
    hp = hp ?? Cleric.maxHp;
    mp = mp ?? Cleric.maxMp;
  }
}

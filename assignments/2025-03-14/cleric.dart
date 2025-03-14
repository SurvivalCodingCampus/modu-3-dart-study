class Cleric {
  final String name;
  int? hp;
  int? mp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  // instance 가 존재하기 전부터 static 은 존재하는 것을 활용해
  // 생성자에 값이 안 들어올 때 static 값 투입
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});
}

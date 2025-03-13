class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  // 생성자
  //hp와 mp의 초기값은 정해져있으므로 생성자는 이름만값만
  Cleric(this.name);

  // 테스트 코드를 위해 mp, hp를 추가해서 검증하려고 할 때
  // Cleric(this.name, this.hp, this.mp);
}
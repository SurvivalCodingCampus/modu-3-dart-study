class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});
}

void main() {
  // 이름, mp, hp 를 지정하여 인스턴스화 성공
  Cleric('아서스', hp: 40, mp: 5);
  // 이름과 hp 값만 지정하여 인스턴스화 성공 mp 는 최대 mp 로 지정
  Cleric('아서스', hp: 45);
  // 이름만 지정하여 인스턴스화 성공 hp, mp 는 최대 hp, mp 로 지정
  Cleric('아서스');
  // 이름 지정 하지 않았기 때문에 생성 불가
  // Cleric();
}

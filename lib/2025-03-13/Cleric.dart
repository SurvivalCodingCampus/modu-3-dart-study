class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;

  String name;
  int hp = 50;
  int mp = 50;

  Cleric(this.name, this.hp, this.mp) {
    //print ('$name, hp: $hp, mp: $mp 성직자 생성');
  }

  void selfAid() {
    //print('$name, 사용전 hp: $hp, 사용전 mp: $mp');
    if (mp >= 5) {
      mp -= 5; //selfAid 사용으로 mp -5 차감
      hp = maxHp; //hp를 최대 H// P까지 회복
    } else {
      print('MP 부족으로 셀프 에이드를 사용할 수 없습니다.');
    }
    //print('$name, 사용후 hp: $hp, 사용후 mp: $mp');
  }
}

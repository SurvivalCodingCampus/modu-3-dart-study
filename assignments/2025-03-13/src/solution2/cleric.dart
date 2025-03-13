class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;
  final int selfAidMpPt = 10;

  // 생성자
  //hp와 mp의 초기값은 정해져있으므로 생성자는 이름만값만
  // Cleric(this.name);

  // 테스트 코드를 위해 mp, hp를 추가해서 검증하려고 할 때
  Cleric(this.name, this.hp, this.mp);


  void selfAid(){
    if (mp < selfAidMpPt) {
      print('$name(은)는 셀프 에이드를 시전했지만 마나가 부족해 시전할 수 없었다.');
    }else if ( hp <= 0 ) {
      print('$name(은)는 셀프 에이드를 시전했지만 유령이기 때문에 아무일도 일어나지 않았다.');
    }else {
      final int prevHp = hp;
      final int prevMp = mp;

      mp -= selfAidMpPt;
      hp == maxHp;
      print('$name(은)는 셀프 에이드를 시전하였다! (Hp $prevHp -> $hp / Mp:$prevMp -> $mp)');

    }
  }
}
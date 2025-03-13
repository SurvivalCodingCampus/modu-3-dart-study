import 'dart:math';

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



  void selfAid() {
    // 셀프 에이드 액션
    if (mp < selfAidMpPt) {
      // 마나 체크
      print('$name(은)는 셀프 에이드를 시전했지만 마나가 부족해 시전할 수 없었다.');
    }else if ( hp <= 0 ) {
      // 체력 체크
      print('$name(은)는 셀프 에이드를 시전했지만 유령이기 때문에 아무일도 일어나지 않았다.');
    }else {
      // 마나/체력 조건을 만족할 때
      final int prevHp = hp;
      final int prevMp = mp;

      mp -= selfAidMpPt;
      hp == maxHp;
      print('$name(은)는 셀프 에이드를 시전하였다! (Hp $prevHp -> $hp / Mp:$prevMp -> $mp)');

    }
  }
  int pray(int sec) {
    // 기도하기(pray) 액션

    if ( hp <= 0 ) {
      // 체력 체크
      print('$name(은)는 기도했지만, 이미 신의 곁에 있어 아무런 일도 일어나지 않았다.');
    }

    //회복 예정인 mp값
    int addMp = sec + Random().nextInt(2);

    //최종 회복될 mp값
    int resultAddMp = 0;

    if (maxMp <= addMp + mp) {
      //회복 결과가 최대 mp값을 초과할 때
      resultAddMp = max(0, maxMp - mp);
    }else {
      //일반적으로 회복할 때
      resultAddMp = addMp;
    }
    mp += resultAddMp;
    print('$name(은)는 기도하기를 $sec초 시전하여 MP $resultAddMp만큼 회복하였다. (현재 MP : $mp)');

    return resultAddMp;
  }

}
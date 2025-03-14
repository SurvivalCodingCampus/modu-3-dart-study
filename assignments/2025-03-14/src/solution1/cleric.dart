import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  // 생성자
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    // 셀프 에이드 마나 소모량
    final int selfAidMpPt = 5;
    // 셀프 에이드 액션
    if (mp < selfAidMpPt) {
      // 마나 체크
      print('$name(은)는 셀프 에이드를 시전했지만 마나가 부족해 시전할 수 없었다.');
    } else if (hp <= 0) {
      // 체력 체크
      print('$name(은)는 셀프 에이드를 시전했지만 유령이기 때문에 아무일도 일어나지 않았다.');
    } else {
      // 마나/체력 조건을 만족할 때
      final int prevHp = hp;
      final int prevMp = mp;

      mp -= selfAidMpPt;
      hp = maxHp;
      print('$name(은)는 셀프 에이드를 시전하였다! (Hp $prevHp -> $hp / Mp:$prevMp -> $mp)');
    }
  }

  int pray(int sec) {
    // 기도하기(pray) 액션

    if (hp <= 0) {
      // 체력 체크
      print('$name(은)는 기도했지만, 이미 신의 곁에 있어 아무런 일도 일어나지 않았다.');
    }

    //회복 예정인 mp값
    int addMp = sec + Random().nextInt(2);

    //최종 회복될 mp값
    int resultAddMp = min(addMp, maxMp - mp);

    mp += resultAddMp;
    print('$name(은)는 기도하기를 $sec초 시전하여 MP $resultAddMp만큼 회복하였다. (현재 MP : $mp)');

    return resultAddMp;
  }
}

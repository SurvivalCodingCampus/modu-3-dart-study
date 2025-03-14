import 'dart:math';

class Cleric { //class 설정
  final int maxhp = 50; // maxhp, maxmp는 상수(final) 필드
  final int maxmp = 10;

  String name;
  int hp = 50; // 초기치
  int mp = 10;

  Cleric(this.name, this.hp, this.mp); // maxhp, maxmp는 상수로 설정되어있으므로 제외

  void selfAid() {
    if (mp >= 5) { //mp 값이 최소 5는 있어야 스킬을 사용할 수 있으므로 조건설정
      mp -= 5; // mp = mp -5 5만큼 사용한다.
      hp = maxhp; // hp를 maxhp로 만든다.
      print('$name가 마력 5를 소비해 체력을 전부 회복했다.'); //$사용해서 변수에 맞춰 변경
    }
  }

  int pray(int praytime) { // pray라는 행동 설정(pay시간을 넣어줄 예정)

    int mprecover = Random().nextInt(3) + praytime; // 0~2까지의 랜덤한 수에 기도한 시간을 더해 mprecover을 만든다.
    if (mp + mprecover > maxmp) {   // mp가 maxmp를 넘어갈 수 없으므로 mprecover는 maxmp에서 현재 mp만큼을 빼준 값이 되어야한다.
      mprecover = maxmp - mp;       // mprecover은 실제로 회복된 양을 반환해야하므로
    }
      mp += mprecover;    // mp = mprecover + mp
      print('$name가 기도를 통해 $mprecover 마력을 회복했다.'); // 실제로 회복된 양
      print('$name의 마력이 $mp가 되었다.'); // 현재 총 마력양
      return mprecover;
    }
  }


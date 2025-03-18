import 'dart:math';

//class 설정
class Cleric {
  // maxHp, maxMp는 상수(final) 필드
  final int maxHp = 50;
  final int maxMp = 10;

  String name;
  int hp = 50; // 초기치
  int mp = 10;

  // maxHp, maxMp는 상수로 설정되어 있으므로 제외
  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    //mp 값이 최소 5는 있어야 스킬을 사용할 수 있으므로 조건 설정
    if (mp >= 5) {
      // mp = mp -5 5만큼 사용 한다.
      mp -= 5;
      // hp를 maxHp로 만든다.
      hp = maxHp;
      //$사용해서 변수에 맞춰 변경
      print('$name가 마력 5를 소비해 체력을 전부 회복했다.');
    }
  }

  // pray 라는 행동 설정(pay 시간을 넣어줄 예정)
  int pray(int praytime) {
// 0~2까지의 랜덤한 수에 기도한 시간을 더해 mpRecover 을 만든다.
    int mpRecover = Random().nextInt(3) + praytime;
    // mp가 maxMp 를 넘어갈 수 없으므로 mpRecover 는 maxMp 에서 현재 mp 만큼을 빼준 값이 되어야한다.
    if (mp + mpRecover > maxMp) {
      // mpRecover 은 실제로 회복된 양을 반환해야하므로
      mpRecover = maxMp - mp;
    }
    // mp = mpRecover + mp
      mp += mpRecover;
      print('$name가 기도를 통해 $mpRecover 마력을 회복했다.'); // 실제로 회복된 양
      print('$name의 마력이 $mp가 되었다.'); // 현재 총 마력양
      return mpRecover;
    }
  }


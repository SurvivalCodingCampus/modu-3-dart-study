import 'dart:math';

class Cleric {
  static final int maxHp = 50;
  static final int maxMp = 10;

  String name;

  // 요구사항: 50hp, 10mp 기본 셋팅
  int hp = 50;       //health points
  int mp = 10;       //mana points

  Cleric(this.name, this.hp, this.mp) {

    //print ('name: $name, hp: $hp, mp: $mp 성직자 생성');
  }

  //자기 응급처치기능.
  void selfAid() {

    // MP부족으로 회복 불가능
    if (mp < 5) {
      print('$name 은(는) mp 부족으로 체력 회복이 불가능 합니다.');
      return;
    }

    // MP를 5이상 보유시 최대HPR까지 회복
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('$name 은(는) 체력이 회복되었습니다.');
    }

  }


  //기도하기 동작으로 자신의 mp를 회복한다.
  //회복량은 기도한 시간(초)에 랜덤하게 0~2 포인트 보정한 양이다.
  //3초 기도하면 회복량은 3~5포인트
  //단, 최대 mp보다 회복하는 것은 불가능.
  //리턴값은 실제로 회복된 mp양

  int pray(int timeToPrayInSec) {

    //기도한 시간을 기준으로 랜덤함수 이용 0~2포인트 보정
    int recoveryPoints = Random().nextInt(3);
    // 실제로 회복된 MP양
    int mpRecoveryAmount = 0;

    if (timeToPrayInSec <= 0) {
      print('기도 시간은 최소 1초 이상입니다.');
      return mpRecoveryAmount;
    }

    //실제로 회복된 mp양 계산
    mpRecoveryAmount = timeToPrayInSec + recoveryPoints;
    //최종 mp값 셋팅
    //mp = mp + mpRecoveryAmount;

    // 회복된 mp가 Mp 보다 크면 mp에 최대치 maxMp로 셋팅
    if (mp + mpRecoveryAmount > maxMp) {
      //실제 회복량 계산
      mpRecoveryAmount = mp + mpRecoveryAmount - maxMp;
      mp = maxMp;
      print ('mp량이 최대치 ${maxMp} 를 초과하여 mp가 Max 값으로 재설정 되었습니다.');
    } else {
      mp = mp + mpRecoveryAmount;
      print('총 $mpRecoveryAmount 만큼 회복하여 mp는 $mp 입니다.');
    }

    //print ('mp: $mp,recoveryPoints : $recoveryPoints, mpRecoveryAmount: $mpRecoveryAmount');
    return mpRecoveryAmount;

  }
}

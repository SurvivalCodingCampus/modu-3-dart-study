import 'dart:math';

class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = 50, this.mp = 10});

  void selfAid() {
    // hp 만땅
    if (hp == maxHp) {
      print("이미 HP는 전부 회복 되었습니다");
      return;
    }

    // mp 부족
    if (mp < 5) {
      print("MP가 부족하여 selfAid를 사용할 수 없습니다");
      return;
    }

    // 실행
    mp -= 5;
    hp = maxHp;
  }

  void selfAid2() {
    if (mp < 5) {
      return;
    }

    mp -= 5; // mp = mp -5 5만큼 사용한다.
    hp = maxHp; // hp를 maxhp로 만든다.
    print('$name가 마력 5를 소비해 체력을 전부 회복했다.'); //$사용해서 변수에 맞춰 변경
  }

  void selfAid3() {
    if (mp < 5) {
      print('$name 은(는) mp 부족으로 체력 회복이 불가능합니다.');
      return;
    }

    mp -= 5; //selfAid 사용으로 mp -5 차감
    hp = maxHp; //hp를 최대 H// P까지 회복
    print('$name 은(는) 체력이 회복되었습니다.');
  }

  int pray1(int casting) {
    int recoveredMp = casting + Random().nextInt(3);

    // mp += recoveredMp;
    // // 최대 mp를 넘어서면 최대 mp로 고정
    // if(mp > maxMp){
    //   recoveredMp += maxMp - mp;
    //   mp = maxMp;
    // }

    // mp가 maxMp를 넘지 않도록 설정
    mp = min(mp + recoveredMp, maxMp);

    // mp += recoveredMp;
    // mp = mp.clamp(0, maxMp);

    print("$name이(가) mp $recoveredMp 회복하였습니다. 현재 mp: $mp");
    return recoveredMp;
  }

  int pray2(int prayTime) {
    Random random = Random();

    int correctionValue = random.nextInt(3); // 보정치

    print("보정치 $correctionValue");

    int recoveryValue = prayTime + correctionValue;

    print("회복량 $recoveryValue");

    // 회복 안 되도 되는 경우
    if (mp == maxMp) {
      return 0;
    }

    // 회복 되는 경우
    if ((mp + recoveryValue <= maxMp)) {
      print('실제 회복량 $recoveryValue');
    } else {
      print('실제 회복량 ${maxMp - mp}');
      recoveryValue = maxMp - mp;
    }
    mp += recoveryValue; // 회복코드

    return recoveryValue; // 회복량 리턴 코드
  }

  int pray3(int timeToPrayInSec) {
    if (timeToPrayInSec < 1) {
      print('기도 시간은 최소 1초 이상입니다.');
      return 0;
    }

    //기도한 시간을 기준으로 랜덤 0~2포인트 보정
    final int recoveryPoints = Random().nextInt(3);

    //실제로 회복된 mp양 계산
    final int mpRecoveryAmount = timeToPrayInSec + recoveryPoints;
    //최종 mp값 셋팅
    mp = mp + mpRecoveryAmount;

    // 회복된 mp가 maxMp 보다 크면 mp에 최대치 maxMp로 셋팅
    if (mp > maxMp) {
      mp = maxMp;
      print('mp량이 최대치 $maxMp 를 초과하여 mp가 Max 값으로 재설정 되었습니다.');
    } else {
      print('총 $mpRecoveryAmount 만큼 회복하여 mp는 $mp 입니다.');
    }

    print(
      'mp: $mp,recoveryPoints : $recoveryPoints, mpRecoveryAmount: $mpRecoveryAmount',
    );
    return mpRecoveryAmount;
  }
}

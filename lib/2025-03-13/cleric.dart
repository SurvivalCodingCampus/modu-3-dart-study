import 'dart:math';

class Cleric {
  final String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric(
    this.name,
  );

  // 체력 회복 스킬
  // 체력을 최대로 회복
  void selfAid(){
    // 마나 부족시 return
    if(mp < 6){
      print("MP가 부족하여 스킬을 사용할 수 없습니다.");
      return;
    }
    mp = mp - 5;
    hp = maxHp;
  }

  // 마나 회복 스킬
  // 회복량 - 캐스팅 시간 + 랜덤(0~2)
  // 반환값 - 회복량
  int pray(int casting){
    int recoveredMp = casting + Random().nextInt(3);
    mp += recoveredMp;
    // 최대 mp를 넘어서면 최대 mp로 고정
    if(mp > maxMp){
      recoveredMp += maxMp - mp;
      mp = maxMp;
    }
    print("$name이 mp $recoveredMp 회복하였습니다. 현재 mp: $mp");
    return recoveredMp;
  }
}
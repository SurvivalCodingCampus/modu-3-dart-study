import 'dart:math';

class Cleric{

  static final int maxHp = 50;
  static final int maxMp = 10;


  // 연습문제 1
  String name;
  int? prayTime = 0;
  late int hp;
  late int mp;


  //연습문제 2
  void selfAid(){

    if (maxHp > hp && mp >= 5) {
      mp = mp - 5;
      hp = maxHp;
    }else{
      if (mp < 5) {
        print("MP가 부족하여 selfAid를 사용할 수 없습니다");
      } else {
        print("이미 HP는 전부 회복 되었습니다");
      }
    }


  }

  //연습문제 3
  int pray (int prayTime){

    Random random = Random();
    
    int actualRecovery = 0;
    
    int correctionValue = random.nextInt(3); // 보정치

    int recoveryValue = prayTime + correctionValue;

    //회복 되는 코드 추가하기
    if (mp < maxMp) {
      if (mp + recoveryValue <= maxMp) {
        actualRecovery = recoveryValue;
      } else {
        print("실제 회복량 ${maxMp - mp}");
        actualRecovery = maxMp - mp;
      }
      mp = mp + actualRecovery; // 회복코드

    }

    return actualRecovery; // 회복량 리턴 코드

    //중간 중간에 리턴이 있는 것보다 한번에 리턴하는게 좋음 -> 코드의 맥략을 파악하기 어려워서 그럼
  }

  Cleric(this.name, {int? hp, int? mp, this.prayTime}) : hp = hp ?? maxHp, mp = mp ?? maxMp;

  // 되는 이유
  // final이나 const나 static 같은 상수나 변수는 생성자 본문에서 값을 변경할 수 없기 때문에 초기화 리스트에서 설정을
  // 해줘야 한다
}
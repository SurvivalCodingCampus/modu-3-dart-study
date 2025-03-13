import 'dart:math';

class Cleric{

  // 연습문제 1
  String name;
  int ? prayTime;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50; //final 붙이면 상수
  final int maxMp= 10;



  //연습문제 2
  void selfAid(){
    if(maxHp > hp&& mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }else{
        if(mp < 5) {
          print("MP가 부족하여 selfAid를 사용할 수 없습니다");
        } else {
          print("이미 HP는 전부 회복 되었습니다");
        }
    }
  }

  //연습문제 3
  int pray (int prayTime){

    Random random = Random();

    int correctionValue = random.nextInt(3); // 보정치

    print("보정치 $correctionValue");

    int recoveryValue = prayTime + correctionValue;

    print("회복량 $recoveryValue");

    //회복 되는 코드 추가하기
    if(mp < maxMp){
      if((mp + recoveryValue == maxMp) || (mp + recoveryValue < maxMp)){
        print("실제 회복량 ${recoveryValue}");

      }else{
        print("실제 회복량 ${maxMp - mp}");
        recoveryValue = maxMp - mp;
      }
      mp += recoveryValue; // 회복코드
      return recoveryValue; // 회복량 리턴 코드
    }

    return 0;

    //중간 중간에 리턴이 있는 것보다 한번에 리턴하는게 좋음 -> 코드의 맥략을 파악하기 어려워서 그럼
  }

  Cleric(this.name, {this.prayTime});
}
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
    if(maxHp > hp) {
      mp -= 5;
      hp = maxHp;
    }else{
      print("이미 HP는 전부 회복 되었습니다");
    }
  }

  //연습문제 3
  int pray (int prayTime){

    Random random = Random();

    int correctionValue = random.nextInt(3); // 보정치

    print("보정치 $correctionValue");

    int recoveryValue = prayTime + correctionValue;

    print("회복량 $recoveryValue");

    if(mp < maxMp){
      if(mp + recoveryValue == maxMp){
        print("실제 회복량 ${recoveryValue}");
        return recoveryValue;
      }else if(mp + recoveryValue < maxMp){
        print("실제 회복량 ${recoveryValue}");
        return recoveryValue;
      }else{
        print("실제 회복량 ${maxMp - mp}");
        return maxMp - mp;

      }
    }
    return 0;
  }

  Cleric(this.name, {this.prayTime});
}
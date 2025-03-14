import 'dart:math';

class Cleric {
  String name; // 이름
  int hp;
  int mp;
  static const int maxHp = 50; // 최대 공격력 50 초기화
  static const int maxMp = 10; // 최대 마법력 10 초기화

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp}); // 생성자. 이름 지정

  void selfAid() {
    if (mp < 5) {
      print("mp가 부족하여 hp를 회복할 수 없습니다..");
      return;
    }

    mp -= 5; // mp의 값을 5만큼 감소
    hp = maxHp; // hp의 값을 maxHp값으로 설정
  }

  int pray(int prayTime) {
    Random random = Random(); // 랜덤 객체 생성
    // prayTime에 0~2 사이의 난수를 더하여 회복량 설정
    int recoveryAmount = prayTime + random.nextInt(3);

    mp += recoveryAmount; // 기존 mp값에 회복량을 증가

    // mp값이 maxMp보다 클 경우 maxMp로 설정
    if (mp > maxMp) {
      recoveryAmount = maxMp - mp;
      mp = maxMp;
    }

    return recoveryAmount;
  }
}

void main() {
  String a = 'a';
  String b = a;
  b = 'b';
  print(a);
}

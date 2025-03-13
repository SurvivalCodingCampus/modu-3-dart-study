import 'dart:math';

class Cleric {
  String name; // 이름
  int hp = 50; // 공격력 50 초기화
  final int maxHp = 50; // 최대 공격력 50 초기화
  int mp = 10; // 마법력 10 초기화
  final int maxMp = 10; // 최대 마법력 10 초기화

  Cleric(this.name); // 생성자. 이름 지정

  void selfAid() {
    mp -= 5; // mp의 값을 5만큼 감소
    hp = maxHp; // hp의 값을 maxHp값으로 설정
  }

  int pray(int prayTime) {
    Random random = Random(); // 랜덤 객체 생성

    // prayTime에 0~2 사이의 난수를 더하여 기존 mp값에 더해줌
    mp += prayTime + random.nextInt(3);

    // mp값이 maxMp보다 클 경우 maxMp로 설정
    if (mp > maxMp) {
      mp = maxMp;
    }

    return mp;
  }
}

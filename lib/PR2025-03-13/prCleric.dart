import 'dart:math';

class Cleric {
  String name = "클레릭";
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;
  final Random random = Random();
  late final int randomMp = random.nextInt(3); //변수이기 때문에 late사용 0~2

  //mp를 5소모해 hp를 max로 만드는 메서드
  void selfAid() {
    // 5미만일때 selfAid를 실패함
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('HP가 가득 찼습니다.');
    } else
      print('MP가 부족합니다');
  }

  // second + 0~2의 마나를 회복, 단 최대 mp를 넘어선 안됨. 마나회복 메서드
  int pray(int second) {
    int plusMp = (randomMp + second);
    mp = mp + plusMp;
    if (mp > maxMp) {
      mp = maxMp;
    }
    return plusMp;
  }
}

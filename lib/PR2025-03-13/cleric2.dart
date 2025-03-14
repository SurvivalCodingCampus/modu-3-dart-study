import 'dart:math';

class Cleric {
  String name = "클레릭";
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;
  Random random = Random();
  late final int randomMp = random.nextInt(3);

  void selfAid() {
    // 5미만일때 selfAid를 실패함
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('HP가 가득 찼습니다. ${mp}');
    } else
      print('MP가 부족합니다 ${mp}');
  }

  int pray(int second) {
    int plusMp = second + randomMp;
    mp = mp + plusMp;
    if (mp > maxMp) {
      mp = maxMp;
      print('${mp}');
    }
    return plusMp;
  }
}

void main() {
  Cleric cleric = Cleric();

  cleric.selfAid();
  cleric.selfAid();
  cleric.pray(1);
  cleric.pray(4);
  cleric.selfAid();

  print('${cleric.mp}');
}

import '../2025-03-13/hero.dart';

class Slime {
  int _hp = 50;
  final String _suffix;

  Slime(this._suffix);

  int get hp => _hp;
  set hp(int value) {
    if (value >= 0) {
      _hp = value;
    }
  }

  String get suffix => _suffix;

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  int _poisonCount = 5;    // 독의 초기값 5
  
  PoisonSlime(super._suffix);

  int get poisonCount => _poisonCount;  
  set poisonCount(int value) {
    if (value >= 0) {
      _poisonCount = value;  // poisonCount가 0 이상일 때만 값 설정
    }
  }

  @override
  void attack(Hero hero) {
    super.attack(hero);   // 기본 공격
    if (poisonCount != 0) {
      int supHp = hero.hp ~/ 5;   // hero의 Hp는 int이니 supHp로 1/5 몫 추출
      hero.hp -= supHp;             // 그 supHp를 hero.hp에 빼주기
      print('추가로, 독 포자를 살포했다!');
      print('$supHp 포인트의 데미지');
      poisonCount -= 1;
    }
  }
}

void main() {
  Hero hero = Hero(name: '용사', hp: 150);
      PoisonSlime poisonSlime = PoisonSlime('A');

      // 5번 공격하여 poisonCount를 0으로 만든다
      for (int i = 0; i < 6; i++) {
        poisonSlime.attack(hero);
        print(hero.hp);
      }
}
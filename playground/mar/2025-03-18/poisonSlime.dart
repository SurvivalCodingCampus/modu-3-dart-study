import 'dart:math';

import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;
  Hero? lastAttacker;
  final Random _random = Random();

  PoisonSlime(super.suffix);

  int get poisonDamage => poisonCount + baseDamage;

  @override
  String get name => '독 ${super.name}';

  @override
  void attack(Hero hero) {
    lastAttacker = hero;
    // 보통 슬라임과 같은 공격
    super.attack(hero);
    // poisonCount가 0이 아니면 다음을 추가로 수행한다
    if (poisonCount > 0) {
      //화면에 “추가로, 독 포자를 살포했다!” 를 표시
      print('추가로, 독 포자를 살포했다!');
      int heroCurrentHp = hero.hp ~/ 5;
      //용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고
      hero.hp -= heroCurrentHp;
      //~포인트의 데미지" 라고 표시
      print('$heroCurrentHp포인트의 독 데미지');
      //posionCount 1을 감소
      poisonCount--;
    } else {
      print('독을 다 썻다.');
      // 쿨타임
      if (poisonCount == -3) ;
      poisonCount = 5;
    }
  }

  @override
  set hp(int value) {
    if (value <= 0) {
      print('$name 이/가 죽었습니다.');

      if (_random.nextBool() && lastAttacker != null) {
        print('죽으면서 독가스를 뿜었다');

        if (lastAttacker != null) {
          lastAttacker!.hp -= poisonDamage;
          print('$poisonDamage 포인트의 독가스 데미지');
        }

        if ((lastAttacker?.hp ?? 1) <= 0) {
          print('${lastAttacker?.name ?? '무천도사'} 이/가 사망하였습니다.');
        }
      }
      value = 0;
    }
    super.hp = value;
  }
}

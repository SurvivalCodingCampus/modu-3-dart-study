

import '../core/hero.dart';
import '../core/slime.dart';

class PoisonSlime extends Slime {

  int poisonCount;
  static const int defaultPoisonCount = 5;

  PoisonSlime(super.suffix) : poisonCount = defaultPoisonCount;


  @override
  void attack(Hero hero) {
    // TODO: implement attack
    // super.attack(hero);
    // print hp-10//

    if (poisonCount > 0) {
      print('독 포자를 살포했다!');

      // 용사에게 데미지 발생
      hero.hp = poisonDamage(hero); // 데미지 계산 후 영웅 hp 설정

      // 독 공격 횟수 감소
      poisonCount -= 1;
      print('독 포자 살포 가능 횟수 : $poisonCount회 남음');
      return;
    }
    print('독 포자 살포가 불가능 했다!');


  }

  int poisonDamage(Hero hero) {
    if (hero.hp > 0) {
      int posionDamageValue = (hero.hp / 5).toInt();
      int currentHeroHp = hero.hp < posionDamageValue ? 0 : hero.hp - posionDamageValue;

      print('독 포자에 의해 ${hero.name}은(은) $posionDamageValue의 데미지를 입었다. ${hero.name}의 체력 ${hero.hp} -> $currentHeroHp');
      return currentHeroHp;
    } else {
      print('독 포자랑 상관 없이 이미 ${hero.name}은(는) 저세상으로 떠났다.');
    }
    return 0;
  }

}
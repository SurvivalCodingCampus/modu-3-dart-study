import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/slime.dart';

class PoisonSlime extends Slime {

  static const defaultPoisonCount = 5;
  int poisonCount = defaultPoisonCount;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    //데미지포인트
    int damagePoint = 0;

    //우선, "보통 슬라임과 같은 공격"을 한다.
    super.attack(hero);

    if (poisonCount > 0) {
      print ('추가로, 독 포자를 살포했다!');

      //유지보수위해 수정필요
      damagePoint = hero.hp;
      hero.hp = (hero.hp * 4 / 5).round();  // 1/5 감소 후 반올림
      damagePoint -= hero.hp;
      damagePoint += Slime.slimeAttackPoint; //기본 차감 포인트
      poisonCount -= 1;

      print ('총 $damagePoint포인트의 데미지');

    } else {
      print ('총 ${Slime.slimeAttackPoint}포인트의 데미지');
    }

  }
}

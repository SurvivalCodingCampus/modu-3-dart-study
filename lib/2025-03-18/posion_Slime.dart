import '../2025-03-18/hero.dart';
import '../2025-03-18/slime.dart';

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

      //유지보수위해 아래코드 수정필요
      damagePoint = hero.hp;
      hero.hp = (hero.hp * 4 / 5).round();  // 4/5값 계산후 반올림
      damagePoint -= hero.hp;               // 데미지 포인트 계산
      damagePoint += Slime.slimeAttackPoint; //기본 차감 포인트 10
      poisonCount -= 1;

      print ('$damagePoint포인트의 데미지');

    } else {
      print ('${Slime.slimeAttackPoint}포인트의 데미지');
    }

  }
}

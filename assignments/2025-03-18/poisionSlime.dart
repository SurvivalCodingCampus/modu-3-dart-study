//Slime 클래스를 상속한 PoisionSlime 클래스 생성
import 'hero.dart';
import 'slime.dart';

class PoisionSlime extends Slime {
  PoisionSlime(super.suffix);

  int poisonCount = 5;

  @override
  void attack(Hero hero) {
    //부모의 attack메서드 사용
    super.attack(hero);
    print('슬라임의 기본 공격으로 ${hero.name}의 피가 ${hero.hp.toStringAsFixed(1)}남았다.');
    double damagedHp = hero.hp * 0.2;
    if (poisonCount == 0) {
      print('독공격 횟수가 모두 소진되었습니다.');
    } else if (poisonCount > 0) {
      poisonCount--;
      print('추가로, 독 포자를 살포했다!');
      hero.hp = hero.hp - damagedHp;
      if (hero.hp < 0) {
        print('용사의 Hp가 0이 되었습니다.');
      } else if (hero.hp > 0) {
        print(
          '용사 ${hero.name}의 Hp가 ${damagedHp.toStringAsFixed(1)}만큼 달아서 ${hero.hp.toStringAsFixed(1)}만큼 남았다',
        );
      }
    }
  }
}

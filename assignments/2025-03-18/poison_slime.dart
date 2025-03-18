import 'package:modu_3_dart_study/2025-03-14/hero.dart';

import 'slime.dart';

class PoisonSlime extends Slime {
  /* 팀 피드백 */
  // * superClass가 Named perameter가 아니고 지금 position arguments 정의되어 있음.

  // PoisonSlime(super.suffix,[int poisonCount = 5]); // 순서를 지켜야함으로 비적절
  // PoisonSlime(super.suffix, {int poisonCount = 5});
  // -> PoisonSlime poisonSlime = PoisonSlime('A',poisonCount = 2);
  // -> 이런 식으로도 인스턴스 재정의가 될 수 있고, 인스턴스 생성 arguments 가 복잡해짐

  // 따라서,

  // 필드로 초기화 값을 따로 빼서 관리하거나,
  // int _poisonCount = 5;
  // PoisonSlime(super.suffix);

  // : 이니셜라이저를 사용해서 초기값 세팅해 주기
  int _poisonCount;
  PoisonSlime(super.suffix) : _poisonCount = 5;

  // PoisonSlime(this.suffix) {
  //   _poisonCount = 5;  // 생성자 본문에서 초기화
  // }
  // 그렇다면 생성자 본문과 이니셜라이저는 뭐가 다를까?
  // => 이니셜라이저 리스트를 사용할 경우보다 조금 더 늦게 초기화가 이루어져
  //     효율성 면에서 아쉬움

  // 결과]
  // 필수적인 초기화 작업은 이니셜라이저 리스트를 사용하는 것이 더 적합,
  // 만약 추가적인 로직이 필요한 경우에는 생성자 본문을 사용.

  int get poisonCount => _poisonCount;
  set poisonCount(int poisonCount) {
    _poisonCount = poisonCount;
  }

  @override
  void attack(Hero hero) {
    super.attack(hero); // 보통슬라임 공격

    if (_poisonCount > 0) {
      print("추가로, 독 포자를 살포했다!");
      int damage = (hero.hp / 5).toInt();

      hero.attack(damage);
      _poisonCount--;
    }
  }
}

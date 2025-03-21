import 'item.dart';
import 'monster.dart';
import 'slime.dart';
import 'sword.dart';

void main() {
  // Sword 의 인스턴스
  // Sword 를 생성 했지만 Item 으로 보고있다. (컴파일 시점)
  Item item = Sword(name: '목도');

  // Slime 의 인스턴스
  // Slime 를 생성 했지만 Monster 으로 보고있다. (컴파일 시점)
  Monster monster = Slime(name: '흐물');

  item.equip();
  monster.attack();

  // 컴파일 시점에 해당되는 타입이 가지고 있는 method 만 알고있음.
  // 따라서 Sword 나 Slime 에서 생성한 method 는 알 수 없다.

  // Sword 가 가지고 있는 attack method 사용 불가
  // item.attack();

  // Slime 이 가지고 있는 run method 사용 불가
  // monster.run();
}

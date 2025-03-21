import 'item.dart';

class Sword extends Item {
  String name;

  Sword({required this.name});

  @override
  void equip() {
    print('$name을/를 장착했습니다');
  }

  void attack() {
    print('$name을/를 사용해서 공격 !');
  }
}

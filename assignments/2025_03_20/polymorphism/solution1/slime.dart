import 'monster.dart';

class Slime extends Monster {
  String name;

  Slime({required this.name});

  @override
  void attack() {
    print('슬라임 $name이/가 공격했습니다 !');
  }

  void run() {
    print('슬라임 $name이/가 도망쳤다 !');
  }
}

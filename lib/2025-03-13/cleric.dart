import 'dart:math';

class Cleric {
  String name;
  int HP;
  int MP;
  final int maxHP = 50;
  final int maxMP = 10;

  Cleric (this.name, this.HP, this.MP); // 생성자

  void selfAid() {
    MP -= 5;
    HP = maxHP;
  }
}

void main() {
  final Random random = Random();
  final int randomNumber = random.nextInt(3); //0~2
}
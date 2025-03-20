abstract class Monster {
  void run() {
    print('뚜벅뚜벅');
  }
}

class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임$suffix이/가 도망쳤다');
  }

  void printHaHA() {
    print('HaHa');
  }
}

void main(List<String> arguments) {
  Slime slime = Slime('A');
  Monster monster = Slime('B');

  slime.run();
  monster.run();
  slime.printHaHA();
  // monster.printHaHA();  오류 남 -> 다운캐스팅(타입캐스팅)필요
  Slime slime2 = monster as Slime;
}

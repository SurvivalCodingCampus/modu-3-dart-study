abstract class Monster {
  void run() {
    print('1번');
  }
}

class Slime extends Monster {
  @override
  void run() {
    print('2번');
  }
}

void main() {
  Slime slime = Slime();
  Monster monster = Slime();
  slime.run();
  monster.run();
}
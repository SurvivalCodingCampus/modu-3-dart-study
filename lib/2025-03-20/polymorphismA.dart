class Monster {
  void run() {
    print('몬스터빔');
  }
}

class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임$suffix가 도망간다.');
  }
}

void main(List<String> arguments) {
  Slime slime = Slime('A');
  Monster monster = Slime('B');
  slime.run();
  monster.run();
}

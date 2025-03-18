class Slime{
  final int level = 10;

  int hp;
  String suffix;

  Slime(this.suffix, this.hp);

  void run() {
    print('슬라임 $suffix가 도망갔다');
  }
}
class Slime {
  int hp;
  String suffix;
  final int level = 10;

  Slime(this.hp, this.suffix);

  void run() {
    print('슬라임 $suffix 이(가) 도망쳤다.');
  }
}

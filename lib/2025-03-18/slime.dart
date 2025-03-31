class Slime {
  final String suffix;
  int hp = 50;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix 이/가 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

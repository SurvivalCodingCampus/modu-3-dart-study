class Slime {
  final level = 10;
  final String suffix;
  int hp;
  

  Slime({
    required this.hp,
    required this.suffix,
  });

  void run(){
    print("슬라임 $suffix가 도망갔습니다.");
  }
}
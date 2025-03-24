class Hero {
  String name = "";
  double hp = 0;
  double maxHp = 100;

  Hero({required this.name, required this.hp});

  @override
  String toString() {
    //return super.toString();
    return '내가 만든 히어로';
  }
}

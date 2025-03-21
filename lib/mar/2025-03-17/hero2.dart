class Hero {
  static const int maxHp = 100;
  String name;
  int _hp = maxHp;

  int get hp => _hp;

  set hp(int value) {
    if (value <= 0) {
      value = 0;
      print('$name 이 사망하였습니다.');
    }
    _hp = value;
  }

  Hero({required this.name, required int hp}) : _hp = hp;

  // void attack(Slime slime) {
  //   print('$name 이/가 ${slime.name} 을/를 공격했다.');
  //   slime.hp -= 10;
  // }

  void run() {
    print(' $name run');
  }

  @override
  String toString() {
    return '내가 만든 히어로';
  }

  // 자동완성 가능  Generate
  @override
  bool operator ==(Object other) {
    if (identical((this), other)) {
      return true;
    }
    if (this.runtimeType != other.runtimeType) {
      return false;
    }
    return name == (other as Hero).name;
  }

  @override
  int get hashCode => name.hashCode;
}

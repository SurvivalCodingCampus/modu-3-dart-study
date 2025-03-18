class Hero {
  static const int maxHp = 100;
  static const int maxMp = 100;
  static const int minHp = 0;
  static const int minMp = 0;

  int _hp = maxHp;
  int _mp = maxMp;
  final String name;

  Hero(this.name);

  int get hp => _hp;
  int get mp => _mp;

  set hp(int value) {
    if (value < minHp) {
      _hp = 0;
    }

    if (value > maxHp) {
      _hp = 100;
    }

    _hp = value;
  }

  set mp(int value) {
    if (value < minMp) {
      _mp = 0;
    }

    if (value > maxHp) {
      _mp = 100;
    }

    _mp = value;
  }
}

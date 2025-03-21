class Wand {
  String _name; // 이름
  double _power; //마력

  Wand({required String name, required double power})
      : _name = name,
        _power = power;

  // getter
  String get name => _name;

  double get power => _power;

  // setter
  set name(String name) {
    if (name.length < 3) {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
    _name = name;
  }

  set power(double power) {
    //논리 연산자 || (A or B 참일 경우), && (A and B 둘다 참일 경우)
    if (power < 0.5 || power > 100) {
      throw Exception('0.5 ~ 100 의 마력을 부여하십시오.');
    }
    _power = power;
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(
      {required String name, required int hp, required int mp})
      : _name = name, _hp = hp, _mp = mp;

  // getter
  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  // setter
  set name(String name) {
    if (name.length < 3) {
      throw Exception('이름이 너무 짧습니다.');
    }
    _name = name;
  }

  set hp(int hp) {
    if (hp < 0) {
      hp = 0;
    }
    _hp = hp;
  }

  set mp(int mp) {
    if (mp < 0) {
      throw Exception('mp는 0 이상이 되어야 합니다.');
    }
    _mp = mp;
  }

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('wand를 버릴 수 없습니다.');
    }
    _wand = wand;
  }
}
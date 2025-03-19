void main() {}

class Wand {
  final String _name;
  final double _power;

  Wand(this._name, this._power);

  // 1.
  String get name => _name;

  set name(String value) {
    if (value == null || value.length < 3) {
      throw Exception('$name 이름은 null 일 수 없고,\n반드시 3문자 이상이어야 한다');
    } else {
      value = name;
    }
  }

  // 2.
  double get power => _power;

  set power(double value) {
    double min = 0.5;
    double max = 100.0;
    if (value < min || value > max) {
      throw Exception('$name 마력은 $min 이상 $max 이하 이여야 한다.');
    }
  }
}

class Wizard {
  final String _name;
  final Wand _wand;
  final int _mp;
  final int _hp;

  Wizard(this._name, this._wand, this._mp, this._hp);

  // 1.
  String get name => _name;

  set name(String value) {
    if (value == null || value.length < 3) {
      throw Exception('$name 이름은 null 일 수 없고,반드시 3문자 이상이어야 한다');
    }
  }

  // 3.
  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('$name가 생선된 이후에는 지팡이를 null로 설정할 수 없다.');
    } else {
      value = wand;
    }
  }

  // 4.
  int get mp => _mp;

  set mp(int value) {
    if (value < 0) {
      throw Exception('$name 의 MP는 0이상 이어야 한다.');
    } else {
      value == mp;
    }
  }

  //5.
  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
    }
  }
}

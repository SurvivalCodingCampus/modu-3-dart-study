class Wand {
  String _name; // 이름
  double _power; // 마력

  Wand({required String name, required double power})
    : _name = name,
      _power = power {
    _validateName(name);
    _validatePower(power);
  }

  //------- Power setter & getter
  double get power => _power;

  set power(double value) {
    _validatePower(value);
    _power = value;
  }

  //------- Name setter & getter
  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  // 예외 처리 함수
  void _validatePower(double power) {
    if (power < 0.5 || power > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다');
    }
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception('지팡이의 이름은 3문자 이상이어야 합니다');
    }
  }
}

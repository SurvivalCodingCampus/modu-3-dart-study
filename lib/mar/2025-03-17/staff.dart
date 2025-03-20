class Staff {
  String _name = '';
  double _power = 0;

  Staff({
    required String name,
    required double power,
  }) {
    this.name = name;
    this.power = power;
  }
  String get name => _name;
  double get power => _power;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야합니다.');
    }
    _name = value;
  }

  set power(double value) {
    if (0.5 > value || 100 < value) {
      throw Exception('지팡이의 마력은 0.5이상 100 이하여야 한다');
    }
    _power = value;
  }
}
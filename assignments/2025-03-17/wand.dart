class Wand {
  String _name = '';
  double _power = 0;

  Wand({required String name, required double power}) {
    this.name = name;
    this.power = power;
  }

  String get name => _name;

  double get power => _power;

  set name(String? value) {
    if (value == null) {
      throw Exception('지팡이의 이름을 지정해주세요.');
    }

    if (value.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야합니다.');
    }

    _name = value;
  }

  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception('지팡이의 마력이 범위를 벗어났습니다.');
    }

    _power = value;
  }
}

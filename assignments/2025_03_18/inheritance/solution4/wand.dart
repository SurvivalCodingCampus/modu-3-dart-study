class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power;

  String get name => _name;
  double get power => _power;

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('이름을 입력해주세요.');
    }
    if (value.length < 3) {
      throw Exception('3글자 이상 입력해주세요.');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5) {
      throw Exception('마력이 너무 작습니다 !');
    }
    if (value > 100) {
      throw Exception('마력이 너무 큽니다 !');
    }
    _power = value;
  }
}

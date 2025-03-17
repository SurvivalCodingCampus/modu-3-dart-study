class Wand {
  String _name;
  double _power;

  String get name => _name;
  double get power => _power;

  set name(String value) {
    // 1번. 지팡이의 이름은 3문자 이상이어야함.
    if (value.length < 3) {
      throw Exception('에러메세지 : 지팡이의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  set power(double value) {
    // 2번. 지팡이의 마력은 0.5 이상 100.0 이하여야함.
    if (value < 0.5 || value > 100.0) {
      throw Exception('에러메세지 : 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    _power = value;
  }

  Wand({required String name, required double power})
      : _name =
  name.length < 3
      ? throw Exception('에러메세지 : 지팡이의 이름은 3문자 이상이어야 합니다.')
      : name,
        _power =
        power < 0.5 || power > 100.0
            ? throw Exception('에러메세지 : 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.')
            : power;
}

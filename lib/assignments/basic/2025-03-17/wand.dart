class Wand {
  String _name; // 이름
  double _power; // 마력

  Wand(this._name, this._power) {
    // 생성자에서 이름과 마력 유효성 검사
    _nameValidator();
    _powerValidator();
  }

  String get name => _name;
  set name(String value) {
    _name = value;
    _nameValidator();
  }

  double get power => _power;
  set power(double value) {
    _power = value;
    _powerValidator();
  }

  // 이름 유효성 검사
  void _nameValidator() {
    if (_name.length < 3) {
      throw Exception("지팡이의 이름은 3글자 이상이여야합니다.");
    }
  }

  // 마력 유효성 검사
  void _powerValidator() {
    if (_power < 0.5 || _power > 100) {
      throw Exception("지팡이의 마력은 0.5와 100사이여야합니다.");
    }
  }
}

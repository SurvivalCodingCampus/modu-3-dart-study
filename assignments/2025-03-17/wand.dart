import 'dart:math';

class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power) {
    name = _name;
    power = _power;
  }

  String get name => _name;
  set name(String value) {
    (value.length < 3) ? throw Exception('지팡이의 이름은 3문자 이상이어야 합니다.') : _name = value;
  }

  double get power => _power;
  set power(double value) {
    (value < 0.5 || value > 100.0) ? throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 한다.') : _power = value;
  }
}
import 'task_exception.dart';

class Wand {
  String _name;

  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  double _power;

  double get power => _power;

  set power(double value) {
    _validatePower(value);
    _power = value;
  }

  Wand(String name, double power) : _name = name, _power = power {
    _validateName(name);
    _validatePower(power);
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw TaskException.invalidName;
    }
  }

  void _validatePower(double power) {
    if (power < 0.5 || power > 100.0) {
      throw TaskException.invalidPower;
    }
  }
}

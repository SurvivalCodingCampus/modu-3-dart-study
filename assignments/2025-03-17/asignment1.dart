


class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name.length > 2 ? name : throw Exception('이름은 3글자 이상이여야 합니다.'),
      _power =
          (power >= 0.5 && power <= 100.0)
              ? power
              : throw Exception('마력은 0.5이상 100.0 이하여야합니다.');

  String get name => _name;

  double get power => _power;

  set name(String value) {
    if (value.length > 2) {
      _name = value;
    } else {
      throw Exception("이름은 3글자 이상이여야 합니다.");
    }
  }

  set power(double value) {
    if (value >= 0.5 && value <= 100.0) {
      _power = value;
    } else {
      throw Exception('마력은 0.5이상 100.0 이하여야합니다.');
    }
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;
  Wizard({required String name, required int hp, required int mp, Wand? wand})
    : _name = (name.length > 1) ? name : throw Exception("이름은 2글자 이상이여야 합니다."),
      _hp = (hp < 0) ? 0 : hp,
      _mp = (mp < 0) ? throw Exception('mp는 0이상이여야 합니다.') : mp,
      _wand = wand;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String value) {
    if (value.length > 1) {
      _name = value;
    } else {
      throw Exception("이름은 2글자 이상이여야 합니다.");
    }
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0이상이여야 합니다.');
    } else {
      _mp = value;
    }
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    } else {
      _wand = value;
    }
  }
}

class Person {
  final String name;
  final int birthYear;
  final int _age;

  Person({required this.name, required this.birthYear})
    : _age = DateTime.now().year - birthYear;

  int get age => _age;
}
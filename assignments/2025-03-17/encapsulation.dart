class Wand {
  String _name;
  double _power;

  // 생성자에서 유효성 검사 수행
  Wand({required String name, required double power})
      : _name = name,
        _power = power {
    validate();
  }

  // Getter / Setter
  String get name => _name;
  set name(String value) {
    if (value.isEmpty || value.length < 3) {
      throw Exception("지팡이의 이름은 3자 이상이어야 합니다.");
    }
    _name = value;
  }

  double get power => _power;
  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception("지팡이의 마력은 0.5 이상, 100.0 이하여야 합니다.");
    }
    _power = value;
  }

  // 유효성 검사 함수
  void validate() {
    if (_name.isEmpty || _name.length < 3) {
      throw Exception("지팡이의 이름은 3자 이상이어야 합니다.");
    }
    if (_power < 0.5 || _power > 100.0) {
      throw Exception("지팡이의 마력은 0.5 이상, 100.0 이하여야 합니다.");
    }
  }
}

class Wizard {
  String _name;
  int _mp;
  int _hp;
  Wand _wand;

  // 생성자에서 유효성 검사 수행
  Wizard({required String name, required int mp, required int hp, required Wand wand})
      : _name = name,
        _mp = mp,
        _hp = hp < 0 ? 0 : hp, // HP가 음수면 0으로 설정
        _wand = wand {
    validate();
  }

  // Getter / Setter
  String get name => _name;
  set name(String value) {
    if (value.isEmpty || value.length < 3) {
      throw Exception("마법사의 이름은 3자 이상이어야 합니다.");
    }
    _name = value;
  }

  int get mp => _mp;
  set mp(int value) {
    if (value < 0) {
      throw Exception("MP는 0 이상이어야 합니다.");
    }
    _mp = value;
  }

  int get hp => _hp;
  set hp(int value) {
    _hp = value < 0 ? 0 : value; // HP가 음수라면 0으로 설정
  }

  Wand get wand => _wand;
  set wand(Wand value) {
    if (value == null) {
      throw Exception("마법사는 반드시 지팡이를 가져야 합니다.");
    }
    _wand = value;
  }

  // 유효성 검사 함수
  void validate() {
    if (_name.isEmpty || _name.length < 3) {
      throw Exception("마법사의 이름은 3자 이상이어야 합니다.");
    }
    if (_mp < 0) {
      throw Exception("MP는 0 이상이어야 합니다.");
    }
    if (_hp < 0) {
      _hp = 0; // HP가 음수면 0으로 설정
    }
    if (_wand == null) {
      throw Exception("마법사는 반드시 지팡이를 가져야 합니다.");
  }
}

void main() {
  try {
    // 올바른 객체 생성
    Wand wand = Wand(name: "Elder Wand", power: 50.0);
    Wizard wizard = Wizard(name: "Gandalf", mp: 100, hp: 80, wand: wand);

    print("마법사: ${wizard.name}, HP: ${wizard.hp}, MP: ${wizard.mp}, 지팡이: ${wizard.wand.name}");

    // 잘못된 데이터 테스트 (이름이 3자 미만일 경우 예외 발생)
    wizard.name = "Al";
  } catch (e) {
    print("오류 발생: $e");
  }
}
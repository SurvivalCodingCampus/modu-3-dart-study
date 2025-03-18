class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({
    required String name,
    required int hp,
    int? mp,
    Wand? wand,
  })  : _name = (name.length > 1) ? name : throw Exception("이름은 2글자 이상이어야 합니다."),
        _hp = (hp < 0) ? 0 : hp,
        _mp = mp ?? 100, // ✅ 기본값 100 설정
        _wand = wand;

  int get mp => _mp; // ✅ Getter 추가

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0 이상이어야 합니다.');
    } else {
      _mp = value;
    }
  }
}

class GreatWizard extends Wizard {
  static int baseMp = 150;

  GreatWizard({required super.name, required super.hp, int? mp, super.wand}) {
    print("기본 MP: $_mp"); // ✅ 여기서 _mp가 접근 가능한지 확인
    _mp = mp ?? baseMp; // ✅ Dart 3.7에서 동작하는지 확인
  }
}

void main() {
  var greatWizard = GreatWizard(name: "Dumbledore", hp: 100);
  print("GreatWizard의 MP: ${greatWizard.mp}");
}

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
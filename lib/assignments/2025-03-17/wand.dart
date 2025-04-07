// 지팡이 클래스
class Wand {
  String _name; // 이름
  double _power;

  Wand({required String name, required double power})
    : _power = power,
      _name = name {
    if (name.length < 3) {
      throw Exception("[지팡이] 3글자 이상의 이름을 사용해주세요.");
    }
    if (power < 0.5 || power > 100.0) {
      throw Exception("[지팡이]의 마력은 0.5 이상 100.0 이하로 설정해 주세요.");
    }
  }

  // getter
  String get name => _name;
  double get power => _power;

  // setter
  // - 이름이 null 이 아니고 반드시  3 문자 이상
  set name(String name) {
    if (name == null || name.length < 3) {
      throw Exception("[지팡이] 3글자 이상의 이름을 사용해주세요.");
    }
    _name = name; // 지팡이 이름쓰기 완료
  }

  // 지팡이의 마력은 0.5 이상 100.0 이하
  set power(double power) {
    if (power < 0.5 || power > 100.0) {
      throw Exception("[지팡이]의 마력은  0.5 이상 100.0 이하로 설정해 주세요.");
    }
    _power = power;
  }
}

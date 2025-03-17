class Wand {
  String _name = "";

  double _power = 0;

  Wand({required String name, required double power}) {
    this.name = name; //  setter 호출 (유효성 검사 실행)
    this.power = power; //  setter 호출 (유효성 검사 실행)
  }

  //이 방식은 setter를 호출하지않아 유효성 검사가 실행이 안됨
  // Wand({required String name, required double power})
  //   : _name = name,
  //     _power = power;

  String get name => _name;

  set name(String value) {
    if (value.length < 3) {
      throw Exception("이름이 너무 짧습니다.");
    }
    _name = value;
  }

  double get power => _power;

  set power(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception("파워는 0.5이상 100이하여야 합니다.");
    }
    _power = value;
  }
}

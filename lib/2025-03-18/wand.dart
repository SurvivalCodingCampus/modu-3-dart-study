class Wand {
  static const double minPower = 0.5;
  static const double maxPower = 100.0;

  //인스턴스 변수
  String _name = ''; //이름
  double _power = 0; //마력 private 변수

  Wand({required String name, required double power}) {
    this.name = name;
    this.power = power;
  }

  // power setter: 외부에서 수정 가능
  set power(double value) {
    if (value < minPower || value >= maxPower) {
      throw Exception('power값은 ${minPower} 이상 ${maxPower} 이하여야 합니다.');
    }
    _power = value;
  }

  //power getter: 외부에서 _power 값을 읽을 수 있다.
  double get power => _power;

  // name setter : 외부에서 수정 가능, 단 3문자 이상.
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름이 너무 짧습니다.');
    }
    _name = value;
  }

  // name getter : 외부에서 _name 값을 읽을 수 있다.
  String get name => _name;
}

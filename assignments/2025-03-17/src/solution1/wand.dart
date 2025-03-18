// ignore_for_file: public_member_api_docs, sort_constructors_first
class Wand {
  String _name;
  double _power;

  String get name => _name;

  double get power => _power;

  set name(String? text) {
    if (text == null) {
      throw Exception("이름은 Null일 수 없습니다");
    } else if (text.length < 3) {
      throw Exception("이름은 반드시 3글자 이상이어야 합니다");
    }

    _name = text;
  }

  set power(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception("지팡이의 마력은 0.5 이상 100.0 이하여야 합니다");
    }

    _power = value;
  }

  Wand({required String name, required double power})
    : _name = name,
      _power = power;
}

class Wand {
  static const double minPower = 0.5;
  static const double maxPower = 100.0;

  String name;
  double power;

  Wand({required this.name, required this.power}) {
    if (name.length < 3) {
      throw Exception('이름은 반드시 3글자 이상이어야 합니다.');
    }

    if (power < minPower || power > maxPower) {
      throw Exception('마력은 $minPower 이상 $maxPower 이하여야 합니다.');
    }
  }
}

class Wand {
  static const _wandMinPower = 0.5;
  static const _wandMaxPower = 100;

  late String _name;
  late double _power;

  String get name => _name;

  double get power => _power;

  set wandNameValidation(String name) {
    // if (name == null) {
    //   print("지팡이의 이름은 null일 수 없습니다");
    //   throw Exception("지팡이의 이름은 null일 수 없습니다");
    // }

    if (name.length < 3) {
      // print("지팡이의 이름은 최소 3자 이상이여야 합니다");
      throw Exception("지팡이의 이름은 최소 3자 이상이여야 합니다");
    }

    _name = name;
  }

  set wandPowerValidation(double power) {
    // if (power == null) {
    //   print("지팡이의 마력은 null일 수 없습니다");
    //   throw Exception("지팡이의 마력은 null일 수 없습니다");
    // }

    if (power < _wandMinPower) {
      throw Exception(
        "지팡이의 마력은 $_wandMinPower 보다 작을 수 "
        "없습니다",
      );
    }

    if (power > _wandMaxPower) {
      throw Exception(
        "지팡이의 마력은 $_wandMaxPower 보다 클 수"
        " 없습니다",
      );
    }

    _power = power;
  }

  Wand({required String name, required double power}) {
    wandNameValidation = name;
    wandPowerValidation = power;
    print("$name라는이름의 $power (의)힘을 가진 Wand가 생성되었습니다!");
  }
}

class Wand {
  final String name;
  double power;

  Wand({required this.name, required this.power});

  String? nameLength(String name) {
    if (name.length < 3) return '이름은 3글자 이상이어야 합니다.';
    return null;
  }

  double wandPower(double power) {
    if (power >= 0.5 && power <= 100) return power;
    return throw Exception('지팡이의 마력은 0.5 이상, 100.0 이하여야 한다');
  }
}

class Wizard {
  final String name;
  final Wand? wand;
  int hp;
  int mp;

  Wizard({
    required this.name,
    required this.wand,
    required this.hp,
    required this.mp,
  });

  String? nameLength(String name) {
    if (name.length < 3) return '이름은 3글자 이상이어야 합니다.';
    return null;
  }

  int wizardMp(int mp) {
    if (mp > 0) return mp;
    return throw Exception('마법사의 MP는 0 이상이어야 한다.');
  }

  int wizardHp(int hp) {
    if (hp < 0) return 0;
    return hp;
  }
}

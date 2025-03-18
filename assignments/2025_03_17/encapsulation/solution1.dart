// 연습 문제 1, 1-2

class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power;

  String get name => _name;
  double get power => _power;

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('이름을 입력해주세요.');
    }
    if (value.length < 3) {
      throw Exception('3글자 이상 입력해주세요.');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5) {
      throw Exception('마력이 너무 작습니다 !');
    }
    if (value > 100) {
      throw Exception('마력이 너무 큽니다 !');
    }
    _power = value;
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({required String name, required int hp, required int mp, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand;

  Wand? get wand => _wand;
  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이는 필수입니다.');
    }
    _wand = value;
  }

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('이름을 입력해주세요.');
    }
    if (value.length < 3) {
      throw Exception('3글자 이상 입력해주세요.');
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      print('0보다 작을 수 없기 때문에 0으로 변환');
      _hp = 0;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('0보다 작은수는 입력할 수 없습니다.');
    }
    _mp = value;
  }
}

void main() {
  Wizard wizard = Wizard(name: '유준', hp: 40, mp: 50);

  print('HP : ${wizard.hp}');
  print('MP : ${wizard.mp}');
  print('이름 : ${wizard.name}');
  print('지팡이 : ${wizard.wand}');
  print('지팡이 이름 : ${wizard.wand?.name}');
  print('지팡이 마력 : ${wizard.wand?.power}');

  // 이름을 입력해주세요 오류 발생
  // wizard.name = '';
  // print('이름 : ${wizard.name}');

  // 3글자 이상 입력해주세요 오류 발생
  // wizard.name = '유준';
  // print('이름 : ${wizard.name}');
}

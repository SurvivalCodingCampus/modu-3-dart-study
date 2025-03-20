class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power {
    if (name.length < 3) {
      throw Exception('이름은 3문자 이상이어야 한다');
    }
    if (0.5 > power || power > 100) {
      throw Exception('마력은 0.5이상 100이하여야 한다');
    }
  }

  String get name => _name;

  double get power => _power;

  //마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3문자 이상이어야 한다');
    }
    _name = value;
  }

  //지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  set power(double value) {
    if (0.5 > value || value > 100) {
      throw Exception('마력은 0.5이상 100이하여야 한다');
    }
    _power = value;
  }
}

// 위자드 클래스
class Wizard {
  String _name;
  int _hp;
  Wand? _wand;
  int _mp;
  static const int maxHp = 100;
  static const int maxMp = 100;

  Wizard({required String name, int hp = maxHp, Wand? wand, int mp = maxMp})
    : _name = name,
      _hp = hp < 0 ? 0 : hp,
      _wand = wand,
      _mp = mp {
    if (name.length < 3) {
      throw Exception('이름은 3문자 이상이어야 합니다.');
    }
    if (mp < 0) {
      throw Exception('MP는 0 이상이어야 합니다.');
    }
  }

  String get name => _name;

  int get hp => _hp;

  Wand? get wand => _wand;

  int get mp => _mp;

  //마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3문자 이상이어야 한다');
    }
    _name = value;
  }

  //마법사의 MP는 0 이상이어야 한다.
  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0 이상이어야 한다');
    }
    _mp = value;
  }

  //HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
  set hp(int value) {
    if (value < 0) {
      value = 0;
    }
    _hp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('마법사가 생성된 이후에는 지팡이를 null로 설정할 수 없다');
    }
    _wand = value;
  }
}

class Person {
  //이름과 태어난 해를 생성자로 받는다 (name, birthYear)
  //이름과 태어난 해는 한번 정해지면 수정이 불가능하다.
  final String _name;
  final int _birthYear;

  Person({
    required String name,
    // required int birthYear
    int birthYear = 2000,
  }) : _name = name,
       _birthYear = birthYear;

  //age 프로퍼티를 통해 나이를 제공하지만, 임의로 수정은 불가능하다.
  //나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다
  int get age => (DateTime.now().year - _birthYear);
}

//홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
void test2() {
  List<Map<String, dynamic>> test2 = [
    {'name': '홍길동', 'age': 20},
    {'name': ' 한석봉', 'age': 25},
  ];
  //그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  for (int i = 0; i < test2.length; i++) {
    print('${test2[i]['name']}의 나이는 ${test2[i]['age']}살');
  }
}

//이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
void test3() {
  //이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  List<Person> persons = [Person(name: '홍길동'), Person(name: '한석봉')];
  //List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
  for (Person name in persons) {
    print('${name._name}');
  }
}

void main() {
  test2();
  test3();
}

void main(List<String> args) {
  // String? temp = null;
  // print(temp.length);

  Person person = Person(name: '홍길동', birthYear: 2020);
  print(person.age);

  Map<String, int> asignment1 = {'홍길동': 20, '한석봉': 25};

  for (final element in asignment1.entries) {
    print('${element.key}의 나이는 ${element.value}살');
  }

  // ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  // “홍길동의 나이는 20살”
  // “한석봉의 나이는 25살”

  Person gildong = Person(name: '홍길동', birthYear: 2000);
  Person seokbong = Person(name: '한석봉', birthYear: 1000);
  List<Person> people = [gildong, seokbong];
  for (final person in people) {
    print(person.name);
  }

  // 이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
  // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
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

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;
  Wizard({required String name, required int hp, required int mp, Wand? wand})
    : _name = (name.length > 1) ? name : throw Exception("이름은 2글자 이상이여야 합니다."),
      _hp = (hp < 0) ? 0 : hp,
      _mp = (mp < 0) ? throw Exception('mp는 0이상이여야 합니다.') : mp,
      _wand = wand;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String value) {
    if (value.length > 1) {
      _name = value;
    } else {
      throw Exception("이름은 2글자 이상이여야 합니다.");
    }
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0이상이여야 합니다.');
    } else {
      _mp = value;
    }
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    } else {
      _wand = value;
    }
  }
}

// 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
// 마법사가 생성된 이후에는 지팡이를 null로 설정할 수 없다.
// 마법사의 MP는 0 이상이어야 한다.
// HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

class Person {
  final String name;
  final int birthYear;
  final int _age;

  Person({required this.name, required this.birthYear})
    : _age = DateTime.now().year - birthYear;

  int get age => _age;
}

// Person 클래스를 작성하시오.

// 이름과 태어난 해를 생성자로 받는다 (name, birthYear)
// 이름과 태어난 해는 한번 정해지면 수정이 불가능하다.
// age 프로퍼티를 통해 나이를 제공하지만, 임의로 수정은 불가능하다.
// 나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다

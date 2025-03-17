프로퍼티(property)

- 클래스의 getter/setter를 프로퍼티라고 부름

getter : 읽기 전용 프로퍼티 구현, 즉 수정 불가
setter : 쓰기 전용 프로퍼티 구현 (잘 안씀), 타당성 검사

getter 쉽게 만드는 단축기 : alt + insert

```dart
class Hero {
  String name;
  int _hp;

  // 생성자 뒤에 붙임으로써 private 지정자를 생성자에 사용가능
  Hero({required this.name, required int hp})
      : _hp = hp;
}
```

```dart
class Person {
  String _name;
  int _birthYear;

//간단한 getter
  String get name => _name;

  int get birthYear => _birthYear;

  Person({required String name, required int birthYear})
      : _name = name,
        _birthYear = birthYear;

  int get age => now - birthYear;
}
```

setter = 유효성 검

```dart
class Wand {
  String _name = "";

  double _power = 0;

  Wand({required String name, required double power}) {
    this.name = name; //  setter 호출 (유효성 검사 실행)
    this.power = power; //  setter 호출 (유효성 검사 실행)
  }

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
```
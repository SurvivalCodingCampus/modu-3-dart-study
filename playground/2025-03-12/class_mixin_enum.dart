mixin Soundable {
  String sound();
}

enum Skin { yellow, black, white }

class Dog with Soundable {
  static const String soundConst = '멍멍';
  String name;

  Dog(this.name);

  @override
  String sound() {
    return soundConst;
  }
}

class Human with Soundable {
  static String staticVar = 'Static';
  static const String soundConst = '사람 소리';
  String name;
  final Skin skin;

  Human(this.name, this.skin);

  set rename(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return 'Human { name: $name }';
  }

  @override
  String sound() {
    return soundConst;
  }
}

void speaker(Soundable soundable) {
  print(soundable.sound());
}

void main() {
  Object? n;
  Object a = Object();

  print(n.runtimeType);
  print(a.runtimeType);

  Human jay = Human('Jay', Skin.yellow);
  Dog dog = Dog('Abbie');

  print(jay);
  print(dog);
  speaker(jay);
  speaker(dog);
}

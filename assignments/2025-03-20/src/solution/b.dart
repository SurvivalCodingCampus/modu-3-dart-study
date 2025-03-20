import 'y.dart';

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

abstract class Character {
  String name;

  Character({required this.name});
}

class Hero extends Character {
  Hero({required super.name});

  void attack() {}
}

void main() {
  Hero hero = Hero(name: '캐릭터');
}

import 'character.dart';

class Enemy extends Character {
  Enemy({required super.name, required super.statistics});

  @override
  String toString() {
    return 'Enemy(name: $name, statistics: $statistics)';
  }
}

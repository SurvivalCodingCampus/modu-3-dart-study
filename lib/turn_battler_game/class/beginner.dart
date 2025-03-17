import '../character.dart';

class Beginner extends Character {
  Beginner({required super.statistics, required super.name});

  @override
  String toString() {
    return 'Beginner(name: $name, statistics: $statistics)';
  }
}

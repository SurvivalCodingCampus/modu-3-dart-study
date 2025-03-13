import 'package:modu_3_dart_study/2025-03-13/turn_battler_game/character.dart';

class Beginner extends Character {
  Beginner({required super.statistics, required super.name});

  @override
  String toString() {
    return 'Beginner(name: $name, statistics: $statistics)';
  }
}

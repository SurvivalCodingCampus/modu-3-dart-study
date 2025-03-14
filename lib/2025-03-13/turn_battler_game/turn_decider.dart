import 'dart:collection';

import 'package:modu_3_dart_study/2025-03-13/turn_battler_game/character.dart';

class TurnDecider {
  Queue<Character> queue = DoubleLinkedQueue();
  final List<Character> characters;

  TurnDecider({required this.characters}) {
    characters.sort((a, b) => a.dex.compareTo(b.dex));
    _ready();
  }

  void _ready() {
    while (characters.isNotEmpty) {
      queue.addLast(characters.removeLast());
    }
  }

  Character next() {
    Character c = queue.removeFirst();
    queue.addLast(c);
    return c;
  }

  Character get peek => queue.first;
}

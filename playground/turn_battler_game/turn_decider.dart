import 'dart:collection';

import 'character.dart';

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

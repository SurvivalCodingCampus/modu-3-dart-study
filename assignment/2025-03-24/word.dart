import 'index.dart';

class Word {
  static const Set<String> vowels = <String>{
    'a',
    'e',
    'i',
    'o',
    'u',
    'A',
    'E',
    'I',
    'O',
    'U',
  };
  String word;

  Word({required this.word});

  bool isVowel(int index) {
    final character = _getCharacter(index);
    return vowels.contains(character);
  }

  bool isConsonant(int index) {
    final character = _getCharacter(index);

    if (_isAlphabet(character)) {
      return !isVowel(index);
    } else {
      throw TaskException.invalidCharacter;
    }
  }

  String _getCharacter(int index) {
    if (_isOutOfRange(index)) {
      throw TaskException.invalidIndex;
    }
    return word[index];
  }

  bool _isOutOfRange(int i) {
    return i < 0 || i >= word.length;
  }

  bool _isAlphabet(String character) {
    final codeUnit = character.codeUnits[0];
    return ((codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122));
  }
}

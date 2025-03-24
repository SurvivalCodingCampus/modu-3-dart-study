import 'vowel.dart';

class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    if (i > word.length || i < 0) {
      throw ArgumentError('$i의 값이 단어의 범위를 벗어났습니다.', 'RangeError');
    }

    return word.substring(i, i + 1) == Vowel.a.mean ||
        word.substring(i, i + 1) == Vowel.e.mean ||
        word.substring(i, i + 1) == Vowel.i.mean ||
        word.substring(i, i + 1) == Vowel.o.mean ||
        word.substring(i, i + 1) == Vowel.u.mean;
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

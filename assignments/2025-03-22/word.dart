import 'vowel.dart';

class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    if (i >= word.length || i < 0) {
      throw ArgumentError('$i의 값이 단어의 범위를 벗어났습니다.', 'i');
    }

    String char = word.substring(i, i + 1).toLowerCase();
    return [
      Vowel.a.mean,
      Vowel.e.mean,
      Vowel.i.mean,
      Vowel.o.mean,
      Vowel.u.mean,
    ].contains(char);
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

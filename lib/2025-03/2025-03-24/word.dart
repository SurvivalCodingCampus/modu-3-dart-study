class Word {
  final String word;

  Word(this.word);

  int get length => word.length;

  bool isVowel(int i) {
    if (i >= word.length) {
      throw ArgumentError(
        'word.length는 ${word.length}입니다. 인자 i는 word의 길이보다 작아야합니다.',
      );
    }

    return RegExp('[aeiouAEIOU]').hasMatch(word[i]);
  }

  bool isConsonant(int i) => !isVowel(i);
}

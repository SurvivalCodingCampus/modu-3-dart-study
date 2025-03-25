class Word {
  String word = '';

  Word(this.word);

  static const List<String> vowels = ['a', 'e', 'i', 'u', 'o'];

  bool isVowel(int i) {
    if (i >= word.length || i < 0) {
      throw Exception(
        '해당 인덱스에 해당하는 문자가 없습니다. 0 이상, ${word.length} 미만의 숫자를 입력해주세요',
      );
    }

    for (final vowel in vowels) {
      if (word[i].toLowerCase() == vowel) {
        return true;
      }
    }

    return false;
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

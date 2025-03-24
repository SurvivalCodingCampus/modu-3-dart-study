class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    if (i >= word.length) {
      print('word의 길이보다 큰 수를 넣을 수 없습니다.');
      return false;
    }
    const List<String> vowels = ['a', 'e', 'i', 'u', 'o'];
    for (final vowel in vowels) {
      if (word[i] == vowel || word[i] == vowel.toUpperCase()) {
        return true;
      }
    }

    return false;
  }

  bool isConsonant(int i) {
    if (i >= word.length) {
      return isVowel(i);
    } else {
      return !isVowel(i);
    }
  }
}

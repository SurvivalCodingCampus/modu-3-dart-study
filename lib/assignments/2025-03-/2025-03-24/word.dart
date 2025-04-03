class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    // 모음
    final vowels = ['a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U'];
    return vowels.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    // 모음이 아니라면 자음이므로 반대값 리턴
    return !isVowel(i);
  }
}

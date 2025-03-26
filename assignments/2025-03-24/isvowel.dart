class Word {
  String word = '';
  static const vowel = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    bool result = vowel.contains(word.substring(i, i + 1).toLowerCase());
    return result;
  }

  //자음을 따로 리스트로 만들어 줄 필요 없이 isVowel에 넣었을때 false가 나오면 다 자음이므로 단순화 가능
  bool isConsonant(int i) {
    return !isVowel(i);
  }

  Word({required this.word});
}

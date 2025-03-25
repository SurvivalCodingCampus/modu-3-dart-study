class Word {
  String word = '';

  bool isVowel(int i) {
    return 'aeiou'.contains(word[i]);
  }

  bool isConsonant(int i) {
    String ch = word[i];
    return 'abcdefghijklmnopqrstuvwxyz'.contains(ch) && !isVowel(i);
  }
}
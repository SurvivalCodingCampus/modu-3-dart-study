class Word {
  static const vowels = ['a', 'e', 'i', 'o', 'u'];
  String word;

  Word({required word}): word = word.toLowerCase();

  bool isVowel(int i) {
    return vowels.contains(word.substring(i, i+1));
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}
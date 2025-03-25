class Word {
  String word;

  Word(this.word);

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      return false;
    }
    String vowel = word[i].toLowerCase();
    return 'aeiou'.contains(vowel);
  }

  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      return false;
    }
    String consonant = word[i].toLowerCase();
    return !'aeiou'.contains(consonant) && consonant.contains(RegExp(r'[a-z]');
  }
}
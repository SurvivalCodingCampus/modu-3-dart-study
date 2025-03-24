class Word {
  String word = '';

  bool isVowel(int i) {
    String letter = word.substring(i, i + 1).toLowerCase(); 
    return letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' || letter == 'u';
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}
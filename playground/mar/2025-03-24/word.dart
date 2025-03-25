class Word {
  String word;

  Word(this.word);

  Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      return false;
    }
    return vowels.contains(word[i].toLowerCase());
  }

  //RegExp 는 정규식
  //https://api.dart.dev/dart-core/RegExp-class.html
  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      return false;
    }
    String char = word[i].toLowerCase();
    return RegExp(r'^[a-z]$').hasMatch(char) && !vowels.contains(char);
  }
}

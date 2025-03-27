class Word {
  String word;

  Word({required this.word});

  bool isVowel(int i) {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
    if (word.length < i) {
      print('문자열의 길이를 초과했습니다.');
      return false;
    }

    return vowels.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    if (word.length < i) {
      print('문자열의 길이를 초과했습니다.');
      return false;
    }

    return !isVowel(i);
  }
}

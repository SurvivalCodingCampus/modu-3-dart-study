class Word {
  final List<String> vowels = ['a', 'e', 'i', 'o', 'u']; // 모음 리스트
  String word;

  Word({required this.word});

  bool isVowel(int i) {
    return vowels.contains(word.substring(i, i + 1).toLowerCase()); // 소문자로 통일 후 포함관계 확인.
  }

  bool isConsonant(int i) {
    return !isVowel(i); // 모음이 아니면 무조건 자음이므로 Not 연산자 사용
  }
}
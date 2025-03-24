class Word {
  String word = '';
  List<String> vowel = ['a', 'e', 'i', 'o', 'u'];
  List<String> consonant = [
    'b',
    'c',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  bool isVowel(int i) {
    //substring(0,2) => 0~1번째 자리까지의 문자만 추출
    bool result = vowel.contains(word.substring(i, i + 1).toLowerCase());
    return result;
  }

  bool isConsonant(int i) {
    bool result = consonant.contains(word.substring(i, i + 1).toLowerCase());
    return result;
  }

  Word({required this.word});
}

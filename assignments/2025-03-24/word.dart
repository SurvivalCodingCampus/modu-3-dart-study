class Word {
  String word = '';
  Word(this.word);
  final Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};
  final Set<String> consonants = {
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
  };

  bool isVowel(int i) {
    String chat = word.substring(i, i + 1).toLowerCase();

    return vowels.contains(chat);
  }

  bool isConsonant(int i) {
    String char = word.substring(i, i + 1).toLowerCase();

    return consonants.contains(char);
  }
}

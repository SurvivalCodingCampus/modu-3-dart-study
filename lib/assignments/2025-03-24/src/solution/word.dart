// ignore_for_file: public_member_api_docs, sort_constructors_first
class Word {
  String word;
  Word(this.word);
  static const vowels = 'aeiou';
  final alphabetRegex = RegExp(r"^[a-zA-Z]*$");

  bool isVowel(int i) {
    if (!isAlphabet(i)) {
      throw FormatException('알파벳이 아닙니다: ${word[i]}');
    }

    return vowels.contains(word[i].toLowerCase());
  }

  bool isConsonant(int i) {
    if (!isAlphabet(i)) {
      throw FormatException('알파벳이 아닙니다: ${word[i]}');
    }
    return !isVowel(i);
  }

  bool isAlphabet(int i) {
    if (i < 0 || i >= word.length) {
      throw RangeError('인덱스가 범위를 벗어났습니다: $i');
    }
    return alphabetRegex.hasMatch(word[i]);
  }
}

void main() {
  final word = Word('H1LLO');

  print(word.isVowel(1));
}

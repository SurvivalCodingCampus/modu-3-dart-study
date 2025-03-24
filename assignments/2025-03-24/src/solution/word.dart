// ignore_for_file: public_member_api_docs, sort_constructors_first
class Word {
  String word;
  Word(this.word);
  final validLetter = RegExp(r"^[a-zA-Z]*$");

  bool isVowel(int i) {
    if (!validLetter.hasMatch(word[i])) {
      print('알파벳이 아닙니다!');
      return false;
    }

    return 'aeiou'.contains(word.toLowerCase().substring(i, i + 1));
  }

  bool isConsonant(int i) {
    if (!validLetter.hasMatch(word[i])) {
      print('알파벳이 아닙니다!');
      return false;
    }
    return !'aeiou'.contains(word.toLowerCase().substring(i, i + 1));
  }
}

void main() {
  final word = Word('H1LLO');

  print(word.isVowel(1));
}

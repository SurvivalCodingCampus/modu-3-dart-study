class Word {
  String word = ' ';

  Word(this.word);

  // i번째 글자가 모음인지 알려주는 메서드
  bool isVowel(int i) {
    String letter = word.substring(i, i + 1);
    bool result = 'aeiouAEIOU'.contains(letter);
    return result;
  }

  //i 번째 글자가 자음인지 알려주는 함수
  bool isConsonant(int i) {
    String letter = word.substring(i, i + 1);
    bool result = !'aeiouAEIOU'.contains(letter);
    return result;
  }
}

void main() {
  Word word = Word('hello');
  print(word.isVowel(2));
  print(word.isConsonant(3));
  print(word.isVowel(1));
}

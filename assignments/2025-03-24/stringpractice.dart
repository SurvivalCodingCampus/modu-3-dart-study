class Word {
  String word = ' ';

  Word(this.word);

  // i번째 글자가 모음인지 알려주는 메서드
  bool isVowel(int i) {
    // 인덱스 범위 제한, 코드레빗 추천
    if (i < 0 || i >= word.length) {
      throw RangeError('인덱스 $i가 범위를 벗어났습니다.');
    }
    String letter = word[i];
    bool result = 'aeiouAEIOU'.contains(letter);
    return result;
  }

  //i 번째 글자가 자음인지 알려주는 함수
  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      throw RangeError('인덱스 $i가 범위를 벗어났습니다.');
    }
    String letter = word[i];
    // 알파벳인지 확인하고 모음이 아닌지 확인
    return RegExp(r'[a-zA-Z]').hasMatch(letter) &&
        !'aeiouAEIOU'.contains(letter);
  } //코드레빗 추천
}

void main() {
  Word word = Word('hello');
  print(word.isVowel(2));
  print(word.isConsonant(3));
  print(word.isVowel(1));
}

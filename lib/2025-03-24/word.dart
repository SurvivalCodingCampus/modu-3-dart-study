class Word {
  String word = '';

  Word(this.word);

  //i 번째 글자가 모음 인지 알려주는 메서드
  bool isVowel(int i) {
    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];

    if (i < 0 || i >= word.length) {
      return false; // 범위를 벗어난 i 값 처리 : 실패
    }

    String letter = word[i].toLowerCase();
    return vowels.contains(letter);
  }

  //i 번째 글자가 자음 인지 알려 주는 메서드
  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      return false; // 범위를 벗어난 i 값 처리 : 실패
    }

    return !isVowel(i);
  }
}


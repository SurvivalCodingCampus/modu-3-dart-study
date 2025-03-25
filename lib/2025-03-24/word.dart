class Word {
  String word;

  Word(this.word);

  bool isVowel(int i) {
    const String vowels = "aeiou";

    // 입력된 인덱스와 문자열의 길이 유효성 검사
    if (i < 0 || i >= word.length) {
      throw RangeError("유효하지 않는 인덱스: $i. 입력할 수 있는 값은 (0-${word.length - 1}) 사이");
    }

    final String char = word[i];

    // 알파벳 유효성 검사 (정규표현식에 사용하는 RegExp 함수를 이용)
    // https://api.dart.dev/stable/dart-core/RegExp-class.html
    if (!RegExp(r'^[a-zA-Z]$').hasMatch(char)) {
      throw ArgumentError("이 문자열의 $i index 알파벳이 아니기 때문에 모음 여부를 검사할 수 없음");
      // return false;
    }
    // 모음인지 확인
    return vowels.contains(char.toLowerCase());
  }

  bool isConsonant(int i) {
    // 자음은 모음이 아니고, 알파벳이어야 함
    return !isVowel(i);
  }
}


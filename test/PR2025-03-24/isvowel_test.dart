import 'package:modu_3_dart_study/PR2025-03-24/isvowel.dart';
import 'package:test/test.dart';

void main() {
  const String word = 'name';
  test('isVowel Test', () {
    final checkWord = Word(word: word);
    //a가 모음인지 확인
    bool result1 = checkWord.isVowel(1);
    bool result2 = checkWord.isConsonant(1);
    //a는 모음이므로 true가 나와야함
    expect(result1, equals(true));
    //a가 자음이 아니므로 false가 나아와야함
    expect(result2, equals(false));
  });
}

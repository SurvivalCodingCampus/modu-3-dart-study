import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-22/word.dart';

void main() {
  const String testWord = 'word';
  const int vowelIndex = 1;
  const int consonantIndex = 0;

  group('모음 자음 : ', () {
    test('모음 성공', () {
      // given
      Word word = Word(testWord);

      // then
      expect(word.isVowel(vowelIndex), isTrue);
    });
    test('모음 실패', () {
      // given
      Word word = Word(testWord);

      // then
      expect(word.isVowel(consonantIndex), isFalse);
    });
    test('자음 실패', () {
      // given
      Word word = Word(testWord);

      // then
      expect(word.isConsonant(vowelIndex), isFalse);
    });
    test('자음 성공', () {
      // given
      Word word = Word(testWord);

      // then
      expect(word.isConsonant(consonantIndex), isTrue);
    });
  });
}

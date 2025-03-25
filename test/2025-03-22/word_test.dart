import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-22/word.dart';

void main() {
  const String testWord = 'word';
  const int vowelIndex = 1;
  const int consonantIndex = 0;
  const int rangeErrorValue = 5;

  group('모음 자음 : ', () {
    test('단어 완벽 생성', () {
      // given
      Word word = Word(testWord);

      // then
      expect(word, TypeMatcher<Word>());
      expect(word.word, testWord);
    });
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
    test('모음 범위 에러', () {
      // given
      Word word = Word(testWord);

      // then
      expect(() => word.isVowel(rangeErrorValue), throwsA(isArgumentError));
    });
    test('자음 범위 에러', () {
      // given
      Word word = Word(testWord);

      // then
      expect(() => word.isConsonant(rangeErrorValue), throwsA(isArgumentError));
    });
  });
}

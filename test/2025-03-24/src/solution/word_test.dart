import 'package:test/test.dart';

import '../../../../assignments/2025-03-24/src/solution/word.dart';

void main() {
  const String testWord = 'hello';
  // given
  final word = Word(testWord);
  group('Word', () {
    test('생성', () {
      // then
      expect(word, isA<Word>());
      expect(word.word, testWord);
    });

    test('모음 확인 - 소문자', () {
      // then
      expect(word.isVowel(0), false);
      expect(word.isVowel(1), true);
      expect(word.isVowel(4), true);
    });

    test('모음 확인 - 대문자', () {
      word.word = testWord.toUpperCase();
      // then
      expect(word.isVowel(0), false);
      expect(word.isVowel(1), true);
      expect(word.isVowel(4), true);
    });

    test('자음 확인 - 소문자', () {
      // then
      expect(word.isConsonant(0), true);
      expect(word.isConsonant(1), false);
      expect(word.isConsonant(4), false);
    });

    test('자음 확인 - 대문자', () {
      word.word = testWord.toUpperCase();
      // then
      expect(word.isConsonant(0), true);
      expect(word.isConsonant(1), false);
      expect(word.isConsonant(4), false);
    });

    test('숫자인 경우', () {
      word.word = 'h12lo';
      // then
      expect(word.isConsonant(0), true);
      expect(word.isConsonant(1), false);
      expect(word.isVowel(1), false);
      expect(word.isVowel(4), true);
    });
  });
}

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-24/word.dart';

void main() {
  group('Word', () {
    test('모음 자음', () {
      Word word = Word('abc');

      expect(word.isVowel(0), isTrue, reason: 'a는 모음입니다.');
      expect(word.isConsonant(0), isFalse, reason: 'a는 자음이 아닙니다.');

      expect(word.isVowel(1), isFalse, reason: 'b는 모음이 아닙니다.');
      expect(word.isConsonant(1), isTrue, reason: 'b는 자음입니다.');

      expect(word.isVowel(2), isFalse, reason: 'c는 모음이 아닙니다.');
      expect(word.isConsonant(2), isTrue, reason: 'c는 자음입니다.');
    });

    test('대소문자', () {
      Word word = Word('AbC');

      expect(word.isVowel(0), isTrue, reason: 'A는 모음입니다.');
      expect(word.isConsonant(0), isFalse, reason: 'A는 자음이 아닙니다.');

      expect(word.isVowel(1), isFalse, reason: 'b는 모음이 아닙니다.');
      expect(word.isConsonant(1), isTrue, reason: 'b는 자음입니다.');

      expect(word.isVowel(2), isFalse, reason: 'c는 모음이 아닙니다.');
      expect(word.isConsonant(2), isTrue, reason: 'c는 자음입니다.');
    });

    test('특수문자와 숫자가 포함', () {
      Word word = Word('A1!bc@');

      expect(word.isVowel(0), isTrue, reason: 'A는 모음입니다.');
      expect(word.isConsonant(0), isFalse, reason: 'A은 자음이 아닙니다.');

      expect(word.isVowel(1), isFalse, reason: '1은 모음이 아닙니다.');
      expect(word.isConsonant(1), isFalse, reason: '1은 자음이 아닙니다.');

      expect(word.isVowel(2), isFalse, reason: '!는 모음이 아닙니다.');
      expect(word.isConsonant(2), isFalse, reason: '!는 자음이 아닙니다.');

      expect(word.isConsonant(3), isTrue, reason: 'b는 자음입니다.');
      expect(word.isVowel(3), isFalse, reason: 'b는 모음이 아닙니다.');

      expect(word.isConsonant(4), isTrue, reason: 'c는 자음입니다.');
      expect(word.isVowel(4), isFalse, reason: 'c는 모음이 아닙니다.');
    });

    test('알파벳 전체', () {
      Word word = Word('abcdefghijklmnopqrstuvwxyz');

      for (int i = 0; i < word.word.length; i++) {
        String char = word.word[i];
        if ('aeiou'.contains(char)) {
          expect(word.isVowel(i), isTrue, reason: '$char는 모음입니다.');
          expect(word.isConsonant(i), isFalse, reason: '$char는 자음이 아닙니다.');
        } else {
          expect(word.isConsonant(i), isTrue, reason: '$char는 자음입니다.');
          expect(word.isVowel(i), isFalse, reason: '$char는 모음이 아닙니다.');
        }
      }
    });
  });
}

import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-24/word.dart';

void main() {
  group('Word 클래스', () {
    test('isVowel 메소드 테스트 모음이 소문자일때', () {
      String testString = 'helloaeiou';
      Word word = Word(testString);
      expect(word.isVowel(1), isTrue);
      for (int i = 5; i < 10; i++) {
        expect(word.isVowel(i), isTrue);
      }
    });
    test('isVowel 메소드 테스트 모음이 대문자일때', () {
      String testString = 'HELLOAEIOU';
      Word word = Word(testString);
      expect(word.isVowel(1), isTrue);
      for (int i = 5; i < 10; i++) {
        expect(word.isVowel(i), isTrue);
      }
    });
    test('isConsonant 메소드 테스트', () {
      String testString = 'xyzXYZaeiouAEIOU';
      Word word = Word(testString);
      for (int i = 0; i < 6; i++) {
        expect(word.isConsonant(i), isTrue);
      }
      for (int i = 6; i < testString.length; i++) {
        expect(word.isConsonant(i), isFalse);
      }
    });

    test('범위를 벗어난 인덱스를 입력했을때 테스트', () {
      String testString = 'hello';
      Word word = Word(testString);
      expect(() => word.isVowel(-1), throwsA(isA<Exception>()));
      expect(() => word.isVowel(testString.length), throwsA(isA<Exception>()));
    });
  });
}

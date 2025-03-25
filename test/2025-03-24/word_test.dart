import 'package:test/test.dart';
import '../../assignments/2025-03-24/word.dart';

void main() {
  group("Word 클래스 테스트", () {
    test("isVowel() 메서드가 정확하게 모음을 판별해야 함", () {
      Word word = Word();
      word.word = "hello";

      expect(word.isVowel(0), isFalse, reason: "'h'는 모음이 아님");
      expect(word.isVowel(1), isTrue, reason: "'e'는 모음임");
      expect(word.isVowel(2), isFalse, reason: "'l'는 모음이 아님");
      expect(word.isVowel(3), isFalse, reason: "'l'는 모음이 아님");
      expect(word.isVowel(4), isTrue, reason: "'o'는 모음임");
    });

    test("isConsonant() 메서드가 정확하게 자음을 판별해야 함", () {
      Word word = Word();
      word.word = "hello";

      expect(word.isConsonant(0), isTrue, reason: "'h'는 자음임");
      expect(word.isConsonant(1), isFalse, reason: "'e'는 자음이 아님");
      expect(word.isConsonant(2), isTrue, reason: "'l'는 자음임");
      expect(word.isConsonant(3), isTrue, reason: "'l'는 자음임");
      expect(word.isConsonant(4), isFalse, reason: "'o'는 자음이 아님");
    });

    test("빈 문자열에서 호출하면 예외가 발생해야 함", () {
      Word word = Word();

      expect(() => word.isVowel(0), throwsA(isA<RangeError>()), reason: "빈 문자열에서 호출하면 예외 발생");
      expect(() => word.isConsonant(0), throwsA(isA<RangeError>()), reason: "빈 문자열에서 호출하면 예외 발생");
    });

    test("index가 문자열 길이를 초과하면 예외가 발생해야 함", () {
      Word word = Word();
      word.word = "test";

      expect(() => word.isVowel(4), throwsA(isA<RangeError>()), reason: "index 4는 문자열 범위를 초과함");
      expect(() => word.isConsonant(4), throwsA(isA<RangeError>()), reason: "index 4는 문자열 범위를 초과함");
    });
  });
}
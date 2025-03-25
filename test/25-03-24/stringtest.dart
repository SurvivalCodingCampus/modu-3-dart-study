import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-24/stringpractice.dart';

void main() {
  group('자음 모음 테스트', () {
    test('소문자 인식 확인', () {
      final word = Word('hello');
      expect(word.isVowel(2), equals(false));
      expect(word.isConsonant(3), equals(true));
      expect(word.isVowel(1), equals(true));
    });

    test('대문자 인식 확인', () {
      final word = Word('HELLO');
      expect(word.isVowel(2), equals(false));
      expect(word.isConsonant(3), equals(true));
      expect(word.isVowel(1), equals(true));
    });
  });
}

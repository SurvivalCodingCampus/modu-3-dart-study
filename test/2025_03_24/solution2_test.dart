import 'package:test/test.dart';

import '../../assignments/2025_03_24/string/word.dart';

void main() {
  group('문자열', () {
    final word = Word(word: 'abcdef');
    test('isVowel Test', () {
      word.isVowel(0); // 'a'
      word.isVowel(1); // 'b'
      word.isVowel(2); // 'c'
      word.isVowel(3); // 'd'
      word.isVowel(4); // 'e'
      word.isVowel(5); // 'f'

      expect(word.isVowel(0), isTrue);
      expect(word.isVowel(1), isFalse);
      expect(word.isVowel(2), isFalse);
      expect(word.isVowel(3), isFalse);
      expect(word.isVowel(4), isTrue);
      expect(word.isVowel(5), isFalse);
    });
    test('isConsonant Test', () {
      word.isConsonant(0); // 'a'
      word.isConsonant(1); // 'b'
      word.isConsonant(2); // 'c'
      word.isConsonant(3); // 'd'
      word.isConsonant(4); // 'e'
      word.isConsonant(5); // 'f'

      expect(word.isConsonant(0), isFalse);
      expect(word.isConsonant(1), isTrue);
      expect(word.isConsonant(2), isTrue);
      expect(word.isConsonant(3), isTrue);
      expect(word.isConsonant(4), isFalse);
      expect(word.isConsonant(5), isTrue);
    });
  });
}

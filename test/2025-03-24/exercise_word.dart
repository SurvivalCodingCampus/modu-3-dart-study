import 'package:modu_3_dart_study/2025-03-24/exercise_word.dart';
import 'package:test/test.dart';

void main() {
  Word vowel = Word('vowel');
  Word consonant = Word('consonant');

  group('낱말 테스트', () {
    test('모음 확인', () {
      expect(vowel.isVowel(1), equals(true));
      expect(vowel.isVowel(2), equals(false));
    });
    test('자음 확인', () {
      expect(consonant.isConsonant(1), equals(false));
      expect(consonant.isConsonant(2), equals(true));
    });
  });

}

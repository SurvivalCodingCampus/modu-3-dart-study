import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-24/word.dart';

void main() {
  test('모음', () {
    Word word = Word('apple');

    expect(word.isVowel(0), isTrue);
    expect(word.isVowel(2), isFalse);
  });
  test('자음', () {
    Word word = Word('apple');

    expect(word.isConsonant(0), isFalse);
    expect(word.isConsonant(2), isTrue);
  });
}

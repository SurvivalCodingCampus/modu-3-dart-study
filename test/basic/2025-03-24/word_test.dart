import 'package:test/test.dart';

import '../../../assignments/basic/2025-03-24/word.dart';

void main() {
  group("word 함수 테스트", () {
    final word = Word("name");
    final word2 = Word("NAME");

    test("모음 확인 테스트", () {
      final aIndex = word.word.indexOf('a');
      final eIndex = word.word.indexOf('e');
      final aIndex2 = word2.word.indexOf('A');
      final eIndex2 = word2.word.indexOf('E');
      expect(word.isVowel(aIndex), equals(true));
      expect(word.isVowel(eIndex), equals(true));
      expect(word2.isVowel(aIndex2), equals(true));
      expect(word2.isVowel(eIndex2), equals(true));
    });

    test("자음 확인 테스트", () {
      final nIndex = word.word.indexOf('n');
      final mIndex = word.word.indexOf('m');
      final nIndex2 = word2.word.indexOf('N');
      final mIndex2 = word2.word.indexOf('M');
      expect(word.isConsonant(nIndex), equals(true));
      expect(word.isConsonant(mIndex), equals(true));
      expect(word2.isConsonant(nIndex2), equals(true));
      expect(word2.isConsonant(mIndex2), equals(true));
    });
  });
}

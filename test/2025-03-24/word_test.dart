import 'package:test/test.dart';

import '../../assignments/2025-03-24/word.dart';

void main() {
  group("word 함수 테스트", (){
    final word = Word("name");

    test("모음 확인 테스트", (){
      final aIndex = word.word.indexOf('a');
      final eIndex = word.word.indexOf('e');
      expect(word.isVowel(aIndex), true);
      expect(word.isVowel(eIndex), true);
    });

    test("자음 확인 테스트", (){
      final nIndex = word.word.indexOf('n');
      final mIndex = word.word.indexOf('m');
      expect(word.isConsonant(nIndex), true);
      expect(word.isConsonant(mIndex), true);
    });
  });
}
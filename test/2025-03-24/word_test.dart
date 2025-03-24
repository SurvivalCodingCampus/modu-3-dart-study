import 'package:modu_3_dart_study/2025-03-24/word.dart';
import 'package:test/test.dart';
void main() {
  const String testWord = "KangJiwon88";
  const List<int> vowelIndexes = [1, 5, 7]; // 모음 인덱스: 'a', 'i', 'o'
  const List<int> consonantIndexes = [0, 2, 3, 4, 6, 8]; // 자음 인덱스: 'K', 'n', 'J', 'w', 'n'
  const List<int> numberIndexes = [9, 10]; // 숫자 인덱스: '8', '8'

  group('Word 클래스 테스트', () {
    test('모음 인덱스에서 모음 확인', () {
      const int vowelIndex = 2; // 테스트할 모음 인덱스 ['a', 'i', 'o'];

      //테스트 index 값 유효성 검사
      expect(vowelIndex, lessThan(vowelIndexes.length), reason: '테스트 인덱스값이 잘못 설정되었습니다. 모음 테스트 리스트의 마지막 index는 ${vowelIndexes.length - 1}입니다.');

      final word = Word(testWord);

      // 지정된 모음 인덱스에서 모음인지 확인
      expect(word.isVowel(vowelIndexes[vowelIndex]), isTrue, reason: '인덱스 ${vowelIndexes[vowelIndex]}에서 모음이 아닙니다.');
    });

    test('자음 인덱스에서 자음 확인', () {
      const int consonantIndex = 5; // 테스트할 자음 인덱스 ['K', 'n', 'J', 'w', 'n']

      //테스트 index 값 유효성 검사
      expect(consonantIndex, lessThan(consonantIndexes.length), reason: '테스트 인덱스값이 잘못 설정되었습니다. 자음 테스트 리스트의 마지막 index는 ${consonantIndexes.length - 1}입니다.');

      final word = Word(testWord);

      // 지정된 자음 인덱스에서 자음인지 확인
      expect(word.isConsonant(consonantIndexes[consonantIndex]), isTrue, reason: '인덱스 ${consonantIndexes[consonantIndex]}에서 자음이 아닙니다.');
    });

    test('숫자 인덱스에서 예외 발생', () {
      const int numberIndex = 1; // 테스트할 숫자 인덱스 ['8', '8']

      //테스트 index 값 유효성 검사
      expect(numberIndex, lessThan(numberIndexes.length), reason: '테스트 인덱스값이 잘못 설정되었습니다. 숫자 테스트 리스트의 마지막 index는 ${numberIndexes.length - 1}입니다.');

      final word = Word(testWord);

      // 지정된 숫자 인덱스에서 예외가 발생해야 함
      expect(() => word.isVowel(numberIndexes[numberIndex]), throwsArgumentError);
      expect(() => word.isConsonant(numberIndexes[numberIndex]), throwsArgumentError);
    });
  });
}
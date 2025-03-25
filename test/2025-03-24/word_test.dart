import 'package:modu_3_dart_study/2025-03-24/word.dart';
import 'package:test/test.dart';

void main() {
  group('[Word 클래스] isVowel 메서드 - ', () {

    //기본 기능 테스트 케이스

    test('모음인 경우', () {
      final word = Word('hello');
      //reason 테스트 : 실패시 출력
      expect(word.isVowel(1), isTrue, reason: 'e는 모음'); //
      expect(word.isVowel(4), isTrue, reason: 'o는 모음'); // o는 모음
    });

    test('모음이 아닌 경우', () {
      final word = Word('hello');
      expect(word.isVowel(0), isFalse); // h는 자음
      expect(word.isVowel(2), isFalse); // l는 자음
    });

    //예외 기능 테스트 케이스
    test('입력 값이 대문자 포함', () {
      final word = Word('HELLO');
      expect(word.isVowel(0), isFalse); // H는 자음
      expect(word.isVowel(4), isTrue); //  O는 모음
    });

    test('문자열 범위를 벗어난 인덱스', () {
      final word = Word('hello');
      expect(word.isVowel(-1), isFalse); // 음수 인덱스
      expect(word.isVowel(5), isFalse);  // 길이와 같은 경계값 인덱스
      expect(word.isVowel(6), isFalse);  // 길이 보다 큰 경계값 인덱스
    });

  });

  group('[Word 클래스] isConsonant 메서드 - ', () {
    // isConsonant 메서드 테스트
    test('자음인 경우', () {
      final word = Word('hello');
      expect(word.isConsonant(0), isTrue); // h는 자음
      expect(word.isConsonant(2), isTrue); // l는 자음
    });

    test('자음이 아닌 경우', () {
      final word = Word('hello');
      expect(word.isConsonant(1), isFalse); // e는 모음
      expect(word.isConsonant(4), isFalse); // o는 모음
    });

    test('대문자 자음', () {
      final word = Word('HELLO');
      expect(word.isConsonant(1), isFalse);  // E는 모음
      expect(word.isConsonant(2), isTrue);   // L은 자음
    });

    test('문자열 범위를 벗어난 인덱스', () {
      final word = Word('hello');
      expect(word.isConsonant(-1), isFalse); // 음수 인덱스
      expect(word.isConsonant(5), isFalse); // 길이와 같은 경계값 인덱스
      expect(word.isConsonant(6), isFalse); // 길이보다 큰 경계값 인덱스
    });
  });


}
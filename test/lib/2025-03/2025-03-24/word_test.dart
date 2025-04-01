import 'package:modu_3_dart_study/2025-03/2025-03-24/word.dart';
import 'package:test/test.dart';

void main() {
  final Word word = Word('Dart is Amazing');

  group('[isVowel()]', () {
    test('인자 i가 word의 길이를 넘을 경우 ArgumentError가 발생해야한다.', () {
      // When
      final int i = word.length + 1;

      // Then
      expect(() => word.isVowel(i), throwsA(isA<ArgumentError>()));
    });

    test('i번째 글자가 모음이면 true를 반환해야한다.', () {
      // When
      const int i = 1;
      bool isVowel = word.isVowel(i);

      // Then
      expect(isVowel, isTrue);
    });

    test('i번째 글자가 모음이 아니면 false를 반환해야한다.', () {
      // When
      const int i = 0;
      bool isVowel = word.isVowel(i);

      // Then
      expect(isVowel, isFalse);
    });
  });

  group('[isConsonant()]', () {
    test('인자 i가 word의 길이를 넘을 경우 ArgumentError가 발생해야한다.', () {
      // When
      final int i = word.length + 1;

      // Then
      expect(() => word.isConsonant(i), throwsA(isA<ArgumentError>()));
    });

    test('i번째 글자가 자음이면 true를 반환해야한다.', () {
      // When
      const int i = 0;
      bool isConsonant = word.isConsonant(i);

      // Then
      expect(isConsonant, isTrue);
    });

    test('i번째 글자가 자음이 아니면 false를 반환해야한다.', () {
      // When
      const int i = 1;
      bool isConsonant = word.isConsonant(i);

      // Then
      expect(isConsonant, isFalse);
    });
  });
}

import '../../assignment/2025-03-24/index.dart';
import 'package:test/test.dart';

void main() {
  group('Word 테스트', () {
    test('vowel을 정확히 판별해야 한다.', () {
      const rawWord = 'Hello';
      final word = Word(word: rawWord);
      final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
      final index = 1;

      final isVowel = word.isVowel(index);

      expect(vowels.contains(rawWord[index]), isVowel);
    });

    test('vowel 판별 시 index에 벗어나면 TaskException.invalidIndex를 던진다.', () {
      const rowWord = 'Hello';
      final word = Word(word: rowWord);
      final index = rowWord.length;

      expect(
        () {
          word.isVowel(index);
        },
        throwsA(
          (e) =>
              e is CustomException &&
              e.message == TaskException.invalidIndex.message,
        ),
      );
    });

    test('consonant를 정확히 판별해야 한다.', () {
      Set<String> consonant = {};
      const index = 0;
      final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
      for (int i = 65, j = 97; i <= 90; i++, j++) {
        final lowerCharactor = String.fromCharCode(i);
        final upperCharactor = String.fromCharCode(j);
        if (!vowels.contains(lowerCharactor)) {
          consonant.add(lowerCharactor);
        }
        if (!vowels.contains(upperCharactor)) {
          consonant.add(upperCharactor);
        }
      }

      for (final charactor in consonant) {
        final word = Word(word: charactor);
        expect(word.isConsonant(index), isTrue);
      }
    });

    test('consonant 판별 시 index에 벗어나면 TaskException.invalidIndex를 던진다.', () {
      const rowWord = 'Hello';
      final word = Word(word: rowWord);
      final index = rowWord.length;

      expect(
        () {
          word.isConsonant(index);
        },
        throwsA(
          (e) =>
              e is CustomException &&
              e.message == TaskException.invalidIndex.message,
        ),
      );
    });

    test('consonant 판별 시 알파벳이 아니면 TaskException.invalidCharactor를 던진다.', () {
      const rowWord = '!';
      final word = Word(word: rowWord);

      expect(
        () {
          word.isConsonant(0);
        },
        throwsA(
          (e) =>
              e is CustomException &&
              e.message == TaskException.invalidCharacter.message,
        ),
      );
    });
  });
}

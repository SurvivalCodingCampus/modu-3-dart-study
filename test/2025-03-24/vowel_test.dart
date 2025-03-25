import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../../assignments/2025-03-24/vowel.dart';

void main() {

  final String testWord = 'aeiout';
  final String testWord1 = 'AEIOUT';
  final List testLowerVowels = ['a', 'e', 'i', 'o', 'u'];

  group("Word 클래스", (){

      test("Word 클래스 생성", (){
          Word word = Word(word: testWord);

          expect(word.word, equals(testWord));
          expect(Word.vowels, equals(testLowerVowels));
      });

      test("Vowel 소문자 검출", (){
        Word word = Word(word: testWord);

        expect(word.isVowel(0), equals(true));
        expect(word.isVowel(1), equals(true));
        expect(word.isVowel(2), equals(true));
        expect(word.isVowel(3), equals(true));
        expect(word.isVowel(4), equals(true));
        expect(word.isVowel(5), equals(false));
      });

      test("Vowel 대문자 검출", (){
        Word word = Word(word: testWord1);

        expect(word.isVowel(0), equals(true));
        expect(word.isVowel(1), equals(true));
        expect(word.isVowel(2), equals(true));
        expect(word.isVowel(3), equals(true));
        expect(word.isVowel(4), equals(true));
        expect(word.isVowel(5), equals(false));
      });

      test("isConsonant 소문자 검출", (){
        Word word = Word(word: testWord);

        expect(word.isConsonant(0), equals(false));
        expect(word.isConsonant(1), equals(false));
        expect(word.isConsonant(2), equals(false));
        expect(word.isConsonant(3), equals(false));
        expect(word.isConsonant(4), equals(false));
        expect(word.isConsonant(5), equals(true));
      });

      test("isConsonant 대문자 검출", (){
        Word word = Word(word: testWord1);

        expect(word.isConsonant(0), equals(false));
        expect(word.isConsonant(1), equals(false));
        expect(word.isConsonant(2), equals(false));
        expect(word.isConsonant(3), equals(false));
        expect(word.isConsonant(4), equals(false));
        expect(word.isConsonant(5), equals(true));
      });
  });
}
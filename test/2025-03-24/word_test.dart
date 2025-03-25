import 'package:modu_3_dart_study/2025-03-24/word.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('isVowel 테스트. i번째 글자가 모음일 경우', () {
    final Word word = Word(word: 'Hello');

    expect(word.isVowel(1), isTrue, reason: 'e 이므로 모음이 맞음.');
  });
  test('isVowel 테스트. i번째 글자가 모음이 아닐 경우', () {
    final Word word = Word(word: 'Hello');

    expect(word.isVowel(3), isFalse, reason: 'l 이므로 모음이 아님.');
  });

  test('isConsonant 테스트. i번째 글자가 자음일 경우', () {
    final Word word = Word(word: 'Hello');

    expect(word.isConsonant(3), isTrue, reason: 'l 이므로 자음이 맞음.');
  });
  test('isConsonant 테스트. i번째 글자가 자음이 아닐 경우', () {
    final Word word = Word(word: 'Hello');

    expect(word.isConsonant(1), isFalse, reason: 'e 이므로 자음이 아님.');
  });
}

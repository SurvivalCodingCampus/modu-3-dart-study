import 'package:modu_3_dart_study/2025-03-27/exercise_2.dart';
import 'package:test/test.dart';

void main() {
  group('Birds makeSound', () {
    test('Bird1', () async {
      Bird bird1 = Bird1();

      var soundOne = await bird1.makeSound();

      expect(soundOne, '꾸우');
    });
    test('Bird2', () async {
      Bird bird2 = Bird2();

      var soundTwo = await bird2.makeSound();

      expect(soundTwo, '까악');
    });
    test('Bird2', () async {
      Bird bird3 = Bird3();

      var soundThree = await bird3.makeSound();

      expect(soundThree, '꽥꽥');
    });
  });
}

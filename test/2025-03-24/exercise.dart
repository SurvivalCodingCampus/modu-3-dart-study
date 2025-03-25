import 'package:modu_3_dart_study/2025-03-24/exercise.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StrongeBox test', () {
    test('podlock', () {
      int i = 0;
      var strongBox = StrongBox(KeyType.padlock);

      if (i < 1024) {
        for (int i = 0; i < 1024; i++) {
          expect(strongBox.get(), isNull);
        }
      } else if (i == 1024) {
        expect(strongBox.get(), isNotNull);
      } else {
        expect(strongBox.get(), isNull);
      }
    });
    test('button', () {
      int i = 0;
      var strongBox = StrongBox(KeyType.button);

      if (i < 10000) {
        for (int i = 0; i < 10000; i++) {
          expect(strongBox.get(), isNull);
        }
      } else if (i == 10000) {
        expect(strongBox.get(), isNotNull);
      } else {
        expect(strongBox.get(), isNull);
      }
    });
    test('dial', () {
      int i = 0;
      var strongBox = StrongBox(KeyType.dial);

      if (i < 30000) {
        for (int i = 0; i < 30000; i++) {
          expect(strongBox.get(), isNull);
        }
      } else if (i == 30000) {
        expect(strongBox.get(), isNotNull);
      } else {
        expect(strongBox.get(), isNull);
      }
    });
    test('finger', () {
      int i = 0;
      var strongBox = StrongBox(KeyType.finger);

      if (i < 1000000) {
        for (int i = 0; i < 1000000; i++) {
          expect(strongBox.get(), isNull);
        }
      } else if (i == 1000000) {
        expect(strongBox.get(), isNotNull);
      } else {
        expect(strongBox.get(), isNull);
      }
    });
  });
}

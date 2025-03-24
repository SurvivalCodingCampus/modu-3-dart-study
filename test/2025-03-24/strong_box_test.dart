import 'package:modu_3_dart_study/2025-03-24/strong_box.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox', () {
    test('padlock 사용횟수 도달하기 전에는 null 리턴한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.padlock);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.padlock.max - 2; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isNull);
    });
    test('padlock 사용횟수에 도달하면 StrongBox의 인스턴스를 반환한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.padlock);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.padlock.max - 1; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isA<int>());
      expect(strongBox.get(), a);
    });

    test('button 사용횟수 도달하기 전에는 null 리턴한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.button);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.button.max - 2; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isNull);
    });
    test('button 사용횟수에 도달하면 StrongBox의 인스턴스를 반환한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.button);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.button.max - 1; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isA<int>());
      expect(strongBox.get(), a);
    });

    test('dial 사용횟수 도달하기 전에는 null 리턴한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.dial);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.dial.max - 2; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isNull);
    });
    test('dial 사용횟수에 도달하면 StrongBox의 인스턴스를 반환한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.dial);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.dial.max - 1; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isA<int>());
      expect(strongBox.get(), a);
    });

    test('finger 사용횟수 도달하기 전에는 null 리턴한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.finger);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.finger.max - 2; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isNull);
    });
    test('finger 사용횟수에 도달하면 StrongBox의 인스턴스를 반환한다.', () {
      final StrongBox strongBox = StrongBox(keyType: KeyType.finger);
      final int a = 1;

      strongBox.put(a);

      for (int i = 0; i < KeyType.finger.max - 1; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), isA<int>());
      expect(strongBox.get(), a);
    });
  });
}

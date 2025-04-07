import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-24/key_type.dart';
import 'package:modu_3_dart_study/assignments/2025-03-24/strong_box.dart';

void main() {
  group('StrongBox', () {
    test('String', () {
      StrongBox<String> stringBox = StrongBox<String>(keyType: KeyType.padlock);
      stringBox.put('일기');

      expect(stringBox.get(), isNull, reason: '첫 번째 호출은 실패');
      for (int i = 1; i <= 1024; i++) {
        print(i);
        final result = stringBox.get();

        if (i < 1024) {
          expect(result, isNull, reason: '값을 가져올 수 없음');
        } else {
          expect(result, equals('일기'), reason: '1024번째 값이 리턴되어야 함');
        }
      }
    });

    test('int', () {
      StrongBox<int> intBox = StrongBox<int>(keyType: KeyType.padlock);
      intBox.put(100000000);

      expect(intBox.get(), isNull, reason: '첫 번째 호출은 실패');
      for (int i = 1; i <= 1024; i++) {
        final result = intBox.get();

        if (i < 1024) {
          expect(result, isNull, reason: '값을 가져올 수 없음');
        } else {
          expect(result, equals(100000000), reason: '1024번째 값이 리턴되어야 함');
        }
      }
    });

    test('List<String>', () {
      StrongBox<List<String>> listBox = StrongBox<List<String>>(
        keyType: KeyType.padlock,
      );
      listBox.put(['일기', '금괴']);

      expect(listBox.get(), isNull, reason: '첫 번째 호출은 실패');

      for (int i = 1; i <= 1024; i++) {
        final result = listBox.get();

        if (i < 1024) {
          expect(result, isNull, reason: '값을 가져올 수 없음');
        } else {
          expect(result, equals(['일기', '금괴']), reason: '1024번째 값이 리턴되어야 함');
        }
      }
    });

    test('KeyType switch 확인', () {
      expect(
        StrongBox(keyType: KeyType.padlock).maxOpenCounter(),
        1024,
        reason: 'Padlock 1024',
      );
      expect(
        StrongBox(keyType: KeyType.button).maxOpenCounter(),
        10000,
        reason: 'Button 10000',
      );
      expect(
        StrongBox(keyType: KeyType.dial).maxOpenCounter(),
        30000,
        reason: 'Dial 30000',
      );
      expect(
        StrongBox(keyType: KeyType.finger).maxOpenCounter(),
        1000000,
        reason: 'Finger 1000000',
      );
    });
  });
}

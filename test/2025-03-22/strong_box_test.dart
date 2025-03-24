import 'package:test/test.dart';

import '../../assignments/2025-03-22/key_type.dart';
import '../../assignments/2025-03-22/strong_box.dart';

void main() {
  const String strongBoxInner = 'treasure';
  group('키 박스 : ', () {
    test('완벽 생성', () {
      // given
      StrongBox<String> padlockStrongBox = StrongBox(keyType: KeyType.padlock);
      padlockStrongBox.put(strongBoxInner);

      // when
      expect(padlockStrongBox, isA<StrongBox>());
      expect(
        padlockStrongBox.data,
        isNull,
        reason: '충분한 시도를 하지 않았기 때문에 Null 이다.',
      );
      expect(padlockStrongBox.keyType, KeyType.padlock);
    });
    test('data 없이 생성', () {
      // given
      StrongBox<String> padlockStrongBox = StrongBox(keyType: KeyType.padlock);

      // when
      expect(padlockStrongBox, isA<StrongBox>());
      expect(
        padlockStrongBox.data,
        isNull,
        reason: '충분한 시도를 하지 않았기 때문에 Null 이다.',
      );
      expect(padlockStrongBox.keyType, KeyType.padlock);
    });
    test('패드 락 테스트', () {
      // given
      StrongBox<String> padlockStrongBox = StrongBox(keyType: KeyType.padlock);
      padlockStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < padlockStrongBox.keyType.tries - 1; i++) {
        // then
        expect(padlockStrongBox.data, isNull);
      }

      // then
      expect(padlockStrongBox.data, equals(strongBoxInner));
    });

    test('패드 실패 테스트', () {
      // given
      StrongBox<String> padlockStrongBox = StrongBox(keyType: KeyType.padlock);
      padlockStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < padlockStrongBox.keyType.tries - 2; i++) {
        // then
        expect(padlockStrongBox.data, isNull);
      }

      // then
      expect(padlockStrongBox.data, isNull);
    });

    test('버튼 테스트', () {
      // given
      StrongBox<String> buttonStrongBox = StrongBox(keyType: KeyType.button);
      buttonStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < buttonStrongBox.keyType.tries - 1; i++) {
        // then
        expect(buttonStrongBox.data, isNull);
      }

      // then
      expect(buttonStrongBox.data, equals(strongBoxInner));
    });

    test('버튼 실패 테스트', () {
      // given
      StrongBox<String> buttonStrongBox = StrongBox(keyType: KeyType.button);
      buttonStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < buttonStrongBox.keyType.tries - 2; i++) {
        // then
        expect(buttonStrongBox.data, isNull);
      }

      // then
      expect(buttonStrongBox.data, isNull);
    });

    test('다이얼 실패 테스트', () {
      // given
      StrongBox<String> dialStrongBox = StrongBox(keyType: KeyType.dial);
      dialStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < dialStrongBox.keyType.tries - 1; i++) {
        // then
        expect(dialStrongBox.data, isNull);
      }

      // then
      expect(dialStrongBox.data, equals(strongBoxInner));
    });

    test('다이얼 테스트', () {
      // given
      StrongBox<String> dialStrongBox = StrongBox(keyType: KeyType.dial);
      dialStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < dialStrongBox.keyType.tries - 2; i++) {
        // then
        expect(dialStrongBox.data, isNull);
      }

      // then
      expect(dialStrongBox.data, isNull);
    });

    test('핑거 테스트', () {
      // given
      StrongBox<String> fingerStrongBox = StrongBox(keyType: KeyType.finger);
      fingerStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < fingerStrongBox.keyType.tries - 1; i++) {
        // then
        expect(fingerStrongBox.data, isNull);
      }

      // then
      expect(fingerStrongBox.data, equals(strongBoxInner));
    });

    test('핑거 실패 테스트', () {
      // given
      StrongBox<String> fingerStrongBox = StrongBox(keyType: KeyType.finger);
      fingerStrongBox.put(strongBoxInner);

      // when
      for (int i = 0; i < fingerStrongBox.keyType.tries - 2; i++) {
        // then
        expect(fingerStrongBox.data, isNull);
      }

      // then
      expect(fingerStrongBox.data, isNull);
    });
  });
}

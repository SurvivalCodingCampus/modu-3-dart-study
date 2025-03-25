import 'package:modu_3_dart_study/2025-03-24/key_type.dart';
import 'package:modu_3_dart_study/2025-03-24/strong_box.dart';
import 'package:test/test.dart';

void main() {
  const padlock = KeyType.padLock;
  const button = KeyType.button;
  const dial = KeyType.dial;
  const finger = KeyType.finger;

  late StrongBox<int> padlockBox;
  late StrongBox<int> buttonBox;
  late StrongBox<int> dialBox;
  late StrongBox<int> fingerBox;

  setUp(() {
    padlockBox = StrongBox(keyType: padlock, count: padlock.maxCount - 1);
    buttonBox = StrongBox(keyType: button, count: button.maxCount - 1);
    dialBox = StrongBox(keyType: dial, count: dial.maxCount - 1);
    fingerBox = StrongBox(keyType: finger, count: finger.maxCount - 1);

    padlockBox.put(1);
    buttonBox.put(2);
    dialBox.put(3);
    fingerBox.put(4);
  });

  test('get() 메서드를 호출할 때, 열쇠의 사용 횟수에 도달하기 전에는 null을 리턴해야 한다.', () {
    expect(padlockBox.get(), isNull);
    expect(buttonBox.get(), isNull);
    expect(dialBox.get(), isNull);
    expect(fingerBox.get(), isNull);
  });

  test('get() 메서드를 호출 할 때, 열쇠의 사용 횟수에 도달하면 _item 필드 값을 반환해야한다.', () {
    expect(padlockBox.get(), isNull);
    expect(buttonBox.get(), isNull);
    expect(dialBox.get(), isNull);
    expect(fingerBox.get(), isNull);

    expect(padlockBox.get(), equals(1));
    expect(buttonBox.get(), equals(2));
    expect(dialBox.get(), equals(3));
    expect(fingerBox.get(), equals(4));
  });
}

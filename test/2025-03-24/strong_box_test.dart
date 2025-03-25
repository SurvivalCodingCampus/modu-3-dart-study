import 'package:modu_3_dart_study/2025-03-24/strongBox.dart';
import 'package:test/test.dart';

void main() {

  const int padlock = 1024;
  const int button = 10_000;
  const int dial = 30_000;
  const int finger = 1_000_000;

  group('[StrongBox]', () {
    test('1. 금고에 아이템을 넣고 가져올 수 있어야 한다.', () {
      StrongBox strongBox= StrongBox<String>(KeyType.padlock);

      strongBox.put("집문서");

      //아직 열리지 않음
      for (int i = 1; i < padlock; i++){
        //print(i);
        expect(strongBox.get(), isNull);
      }

      expect(strongBox.get(), equals("집문서"));  //1024번째 시도에서 열림
    });

    test('2. 금고에 아이템이 없을 때 get()을 호출하면 null 반환해야 한다.', () {
      StrongBox strongBox = StrongBox<int>(KeyType.button);

      expect(strongBox.get(), isNull);
    });

    test('3. 금고에는 하나의 아이템만 담을 수 있어야 합니다.', () {
      StrongBox strongBox = StrongBox<double>(KeyType.dial);

      strongBox.put(3.33);
      strongBox.put(2.13);
      //아직 열리지 않음
      for (int i = 1; i < dial; i++){
        //print(i);
        expect(strongBox.get(), isNull);
      }

      expect(strongBox.get(), equals(3.33));  // 처음 넣은 값 유지.
    });
  });
}

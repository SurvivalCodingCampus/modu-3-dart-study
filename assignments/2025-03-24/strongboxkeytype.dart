//연습문제 1에서 작성한 StrongBox 클래스에 열쇠의 종류를 나타내는 열거형 KeyType을 정의하고, ->enum
import 'package:test/expect.dart';

enum KeyType { padlock, button, dial, finger }

class StrongBox<E> {
  E? _key;
  final KeyType keyType;
  int _count = 0;

  StrongBox({required this.keyType});

  int maxKeyCount() {
    switch (keyType) {
      case KeyType.padlock:
        return 1024;
      case KeyType.button:
        return 10000;
      case KeyType.dial:
        return 30000;
      case KeyType.finger:
        return 1000000;
    }
  }

  void put(E key) {
    _key = key;
  }

  E? get() {
    _count++;
    int keyCount = maxKeyCount();
    if (_count < keyCount) {
      return null;
    } else {
      print('잠금이 해제되었습니다.');
      return _key;
    }
  }
}

void main() {
  final strongbox = StrongBox<String>(keyType: KeyType.button);
  strongbox.put('key');
  for (int i = 1; i <= strongbox.maxKeyCount(); i++) {
    String? result = strongbox.get();
    if (result != null) {
      print(result);
    }
  }
}

//열쇠의 종류를 나타내는 필드 값
//열쇠의 종류를 받는 생성자
//단, 열쇠의 종류는 다음 4종류로 한정한다. 각 열쇠 종류는 시도횟수의 한도가 정해져 있다.
//padlock    (1,024회)
//button      (10,000회)
//dial             (30,000회)
//finger       (1,000,000회)
//금고에서 get() 메서드를 호출할 때 마다 사용횟수를 카운트하고 각 열쇠의 사용횟수에 도달하기 전에는 null을 리턴한다.
//
//예를 들어, 쿠팡에서 이 금고를 주문할 때 키 타입을 정해서 주문을 한다.
//금고에 넣고 싶은 것을 넣을 수 있다.
//키 타입에 따라 정해진 횟수만큼은 열리지 않는다.
//횟수에 도달하면 잠금이 해제되어 열린다.

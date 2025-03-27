import '../enum/key_type.dart';

class StrongBox<E> {
  E? element;
  final KeyType key;

  int keyTypeCount = 0;

  StrongBox({this.element, required this.key});

  void put(E? element) {
    element = this.element;
  }

  E? get() {
    int currentKeyTypeInt = getKeyTypeInt();

    if (keyTypeCount == currentKeyTypeInt) {
      return element;
    }

    keyTypeCount++;
    print('$keyTypeCount');
    return null;
  }

  int getKeyTypeInt() {
    switch (key) {
      case KeyType.padLock:
        return 1024;
      case KeyType.button:
        return 10000;
      case KeyType.dial:
        return 30000;
      case KeyType.finger:
        return 1000000;
    }
  }
}

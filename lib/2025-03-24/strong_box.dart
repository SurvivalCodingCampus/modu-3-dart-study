enum KeyType { padlock, button, dial, finger }

class StrongBox<E> {
  E? _data;
  int count = 0;
  final KeyType keyType;

  static const padlockMaxCount = 1024;
  static const buttonMaxCount = 10000;
  static const dialMaxCount = 30000;
  static const fingerMaxCount = 1000000;

  StrongBox({required this.keyType});

  void put(E data) {
    _data = data;
  }

  E? get() {
    count++;
    switch (keyType) {
      case KeyType.padlock:
        if (count < padlockMaxCount) {
          return null;
        }
      case KeyType.button:
        if (count < buttonMaxCount) {
          return null;
        }
      case KeyType.dial:
        if (count < dialMaxCount) {
          return null;
        }
      case KeyType.finger:
        if (count < fingerMaxCount) {
          return null;
        }
    }
    return _data;
  }
}

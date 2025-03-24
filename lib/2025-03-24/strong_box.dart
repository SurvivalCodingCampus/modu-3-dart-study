enum KeyType {
  padlock(1024),
  button(10_000),
  dial(30_000),
  finger(1_000_000);

  final int max;
  const KeyType(this.max);
}

class StrongBox<E> {
  E? _data;
  int _count = 0;
  final KeyType keyType;

  StrongBox({required this.keyType});

  void put(E data) {
    _data = data;
  }

  E? get() {
    _count++;
    switch (keyType) {
      case KeyType.padlock:
        if (_count < KeyType.padlock.max) {
          return null;
        }
      case KeyType.button:
        if (_count < KeyType.button.max) {
          return null;
        }
      case KeyType.dial:
        if (_count < KeyType.dial.max) {
          return null;
        }
      case KeyType.finger:
        if (_count < KeyType.finger.max) {
          return null;
        }
    }
    return _data;
  }
}

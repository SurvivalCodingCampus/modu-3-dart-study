enum KeyType { padlock, button, dial, finger }

class StrongBox<E> {
  KeyType boxKeyType;
  int padlockLock = 0;
  int buttonLock = 0;
  int dialLock = 0;
  int fingerLock = 0;

  E? _items;

  void put(E items) {
    _items = items;
  }

  E? get() {
    switch (boxKeyType) {
      case KeyType.padlock:
        if (padlockLock < 1024) {
          padlockLock += 1;
          return null;
        }
        return _items;
      case KeyType.button:
        if (buttonLock < 10000) {
          buttonLock += 1;
          return null;
        }
        return _items;
      case KeyType.dial:
        if (dialLock < 30000) {
          dialLock += 1;
          return null;
        }
        return _items;
      case KeyType.finger:
        if (fingerLock < 1000000) {
          fingerLock += 1;
          return null;
        }
        return _items;
    }
  }

  StrongBox({required this.boxKeyType});
}

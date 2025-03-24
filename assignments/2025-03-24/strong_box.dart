enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

class StrongBox<E> {
  E? _data;
  final KeyType keyType;
  int _count = 0;

  StrongBox(this.keyType);

  int get maxTry {
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

  void put(E data) {
    _data = data;
  }

  E? get() {
    _count++;
    if (_count >= maxTry) {
      return _data;
    } else {
      return null;
    }
  }
}
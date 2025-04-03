enum KeyType {
  padlock,
  button,
  dial,
  finger;

  int get unlockAttempts {
    switch (this) {
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
}

class StrongBox<T> {
  T? _value;
  final KeyType keyType;
  int _attempts = 0;

  StrongBox(this.keyType);

  void put(T value) {
    _value = value;
  }

  T? get() {
    _attempts++;

    if (_attempts < keyType.unlockAttempts) {
      if (_attempts % (keyType.unlockAttempts ~/ 10) == 0) { // 10% 단위로만 로그 출력 (추가)
        print(" 잠김 ($_attempts/${keyType.unlockAttempts} 시도됨)");
      }
      return null;
    }

    print("잠금 해제!");
    return _value;
  }
}

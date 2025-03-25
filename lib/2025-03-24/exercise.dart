class StrongBox {
  KeyType keyType;
  int _useCount = 0;

  StrongBox(this.keyType);

  int get useCount => _useCount;

  String? get() {
    switch (keyType) {
      case KeyType.padlock:
        if (_useCount >= keyType.count) {
          _useCount++;
          return null;
        } else if (_useCount == keyType.count) {
          return 'padlock 해제: $_useCount 번 호출';
        } else {
          break;
        }
      case KeyType.button:
        if (_useCount >= keyType.count) {
          _useCount++;
          return null;
        } else if (_useCount == keyType.count) {
          return 'button 해제: $_useCount 번 호출';
        } else {
          break;
        }
      case KeyType.dial:
        if (_useCount >= keyType.count) {
          _useCount++;
          return null;
        } else if (_useCount == keyType.count) {
          return 'dial 해제: $_useCount 번 호출';
        } else {
          break;
        }
      case KeyType.finger:
        if (_useCount >= keyType.count) {
          _useCount++;
          return null;
        } else if (_useCount == keyType.count) {
          return 'finger 해제: $_useCount 번 호출';
        } else {
          break;
        }
    }
  }
}

enum KeyType {
  padlock(count: 1024),
  button(count: 10000),
  dial(count: 30000),
  finger(count: 1000000);

  final int count;

  const KeyType({required this.count});
}

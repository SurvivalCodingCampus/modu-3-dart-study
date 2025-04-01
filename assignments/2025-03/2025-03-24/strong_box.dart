enum KeyType {
  padlock(lock: 1024),
  button(lock: 10000),
  dial(lock: 30000),
  finger(lock: 1000000);

  const KeyType({required this.lock});
  final int lock;
}

class StrongBox<T> {
  T? _instance;
  final KeyType _keyType;
  late int _attempts;

  StrongBox({T? instance, required KeyType keyType})
    : _instance = instance,
      _keyType = keyType,
      _attempts = keyType.lock;
  //   {
  // switch (_keyType) {
  //   case KeyType.padlock:
  //     _attempts = 1024;
  //   case KeyType.button:
  //     _attempts = 10000;
  //   case KeyType.dial:
  //     _attempts = 30000;
  //   case KeyType.finger:
  //     _attempts = 1000000;
  // }
  // }

  void put(T instance) {
    _instance = instance;
  }

  T? get() {
    if (_attempts > 0) {
      _attempts -= 1;
      return null;
    } else {
      return _instance;
    }
  }
}

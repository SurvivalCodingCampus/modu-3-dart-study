import 'key_type.dart';

class StrongBox<T> {
  T _instance;
  final KeyType keyType;
  int _count;

  StrongBox(this._instance, {required this.keyType}) : _count = _getCount(keyType);

  T? get get {
    // count가 0이 아니라면 null 반환
    if(_count != 0){
      _count--;
      return null;
    }
    return _instance;
  }

  set put(T value) => _instance = value;

  // keyType에 따라 다르게 count를 반환
  static int _getCount(KeyType keyType) {
    switch (keyType) {
      case KeyType.padlock:
        return StrongBox.padlockCount;
      case KeyType.button:
        return StrongBox.buttonCount;
      case KeyType.dial:
        return StrongBox.dialCount;
      case KeyType.finger:
        return StrongBox.fingerCount;
    }
  }

  int get count => _count;

  static int get padlockCount => 1024;
  static int get buttonCount => 10000;
  static int get dialCount => 30000;
  static int get fingerCount => 1000000;
}

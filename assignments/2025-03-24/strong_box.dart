import 'key_type.dart';

class StrongBox<T> {
  T _instance;
  final KeyType keyType;
  int _count;

  StrongBox(this._instance, {required this.keyType})
    : _count = keyType.maxCount;

  T? get get {
    // count가 0이 아니라면 null 반환
    if (_count != 0) {
      _count--;
      return null;
    }
    return _instance;
  }

  set put(T value) => _instance = value;

  int get count => _count;
}

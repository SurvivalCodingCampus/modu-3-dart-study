import 'index.dart';

class StrongBox<E> {
  E? _data;
  KeyType type;
  int _openCount;

  StrongBox({required this.type, required E? data})
    : _data = data,
      _openCount = 0;

  void put(E data) {
    _data = data;
  }

  E? get() {
    _openCount += 1;
    if (_openCount > type.openCountLimit) {
      return _data;
    } else {
      return null;
    }
  }
}

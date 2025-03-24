import 'key_type.dart';

class StrongBox<E> {
  final KeyType keyType;
  int _openCounter = 0;
  E? _item;

  StrongBox({required this.keyType, E? item}) : _item = item;

  void put(E item) {
    this._item = item;
  }

  int maxOpenCounter() {
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

  E? get() {
    if (_openCounter < maxOpenCounter()) {
      _openCounter++;
      return null;
    } else {
      print('[$_openCounter번째] 성공: $_item');
      return _item;
    }
  }
}

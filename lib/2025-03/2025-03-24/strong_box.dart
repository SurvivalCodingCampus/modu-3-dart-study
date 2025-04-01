import 'package:modu_3_dart_study/2025-03/2025-03-24/key_type.dart';

class StrongBox<T> {
  T? _item;
  final KeyType keyType;
  int _count;

  StrongBox({required this.keyType, int count = 0}) : _count = count;

  void put(T item) => _item = item;

  T? get() {
    if (_count >= keyType.maxCount) {
      return _item;
    } else {
      _count++;
      return null;
    }
  }
}

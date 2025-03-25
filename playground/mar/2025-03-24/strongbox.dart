import 'key.dart';

// void main() {
//   StrongBox<Object> strongBox = StrongBox(KeyType.button);
//   strongBox.put('?');
//   strongBox.put(10000);
//   for (int i = 0; i < KeyType.button.count; i++) {
//     strongBox.get();
//   }
// }

class StrongBox<E> {
  KeyType keyType;
  int _count = 0;
  E? _e;

  StrongBox(this.keyType);

  int get count => _count;

  void put(E e) {
    _e = e;
    _count = 0;
  }

  E? get() {
    _count++;
    if (_count < keyType.count) {
      return null;
    } else {
      return _e;
    }
  }

  Object unlock() {
    E? result;

    for (int i = 0; i < keyType.count; i++) {
      result = get();
    }

    if (result == null) {
      return '잠김';
    } else if (result is int) {
      return '$result원';
    } else if (result is String) {
      return result;
    } else {
      return '금고에 들어갈 수 없는 물건입니다.';
    }
  }
}

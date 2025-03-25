import 'key_type.dart';

class StrongBox<T> {
  T? _data;
  final KeyType keyType;

  // private 으로 선언 후 getter 도 setter 도 안 만들어서
  // 아예 외부에서 접근을 못하게 제한
  int _count;

  StrongBox({required this.keyType}) : _count = 0;

  T? get data {
    _count++;

    if (_count < keyType.tries) {
      return null;
    }

    return _data;
  }

  void put(T value) {
    _data = value;
  }
}

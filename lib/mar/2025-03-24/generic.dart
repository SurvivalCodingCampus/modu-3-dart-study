void main() {
  List list = [];

  Pocket<String> pocket = Pocket();

  final String? data = pocket.get();
  print(data ?? '값 없음');
}

class Pocket<E> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}
//ver1
// void main() {
//   Pocket pocket = Pocket();
//   pocket.put(1);
//
//   final data = pocket.get();
//   print((data as int) + 1);
// }

// ver1
// class Pocket {
//   Object? _data;
//
//   void put(Object data) {
//     _data = data;
//   }
//
//   Object? get() {
//     return _data;
//   }
// }

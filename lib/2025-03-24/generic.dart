import 'package:modu_3_dart_study/2025-03-21/book.dart';

void main() {
  Pocket pocket = Pocket();
  pocket.put(1);

  final data = pocket.get();
  print((data as int) + 1);
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
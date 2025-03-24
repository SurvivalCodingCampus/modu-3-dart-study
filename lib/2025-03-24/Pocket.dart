class Pocket<E> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}

void main() {
  Pocket pocket = Pocket<int>();

  pocket.put(1);
  int? item = pocket.get();

  //pocket.put('1');
  //Object? item2 = pocket.get();
}

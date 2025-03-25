class StrongBox<E> {
  late E _items;

  void put(E items) {
    _items = items;
  }

  E get() {
    if (_items == null) {
      throw Exception("put 메서드가 실행되지 않아 get을 실행할수 없습니다");
    }
    return _items;
  }
}

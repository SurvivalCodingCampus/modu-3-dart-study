class Pocket<E> {
  final List<E> store = [];

  Pocket();

  void add(E data) {
    store.add(data);
  }
}

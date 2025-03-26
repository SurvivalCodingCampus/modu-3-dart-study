class StrongBox<S> {
  S? _data;

  void put(S data) {
    _data = data;
  }

  S? get() {
    print('{$_data}');
    return _data;
  }

  StrongBox({required S? data}) : _data = data;
}

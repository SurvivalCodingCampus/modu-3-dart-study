

enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int maxAttempts;

  const KeyType(this.maxAttempts);
}

class StrongBox<T> {
  T? _item;
  KeyType key;
  int _attempts = 0; // 사용 카운트

  int get attempts => _attempts;

  StrongBox(this.key);

  void put(T item) {
    _attempts = 0;
    _item = item;
  }

  T? get() {
    if (_attempts < key.maxAttempts) {
      _attempts++;
      return _item;
    } else {
      return null;
    }
  }
}

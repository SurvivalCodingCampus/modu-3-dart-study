

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
  int attempts = 0; // 사용 카운트

  StrongBox(this.key);

  void put(T item) {
    _item = item;
  }

  T? get() {
    if (attempts < key.maxAttempts) {
      attempts++;
      return _item;
    } else {
      return null;
    }
  }
}

enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int maxCounts;

  const KeyType(this.maxCounts);
}

class StrongBox<S> {
  S? _data;
  KeyType keyType;
  int tryCount = 0;

  void put(S data) {
    _data = data;
  }

  S? get() {
    if (tryCount < keyType.maxCounts) {
      tryCount++;
      return null;
    } else {
      print('금고가 열렸습니다. $_data를 가져가십시오. 시도횟수 : $tryCount');
      return _data;
    }
  }

  StrongBox({required this.keyType});
}

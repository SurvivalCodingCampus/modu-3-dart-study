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
  int _tryCount = 0;

  int get tryCount => _tryCount;

  void put(S data) {
    _data = data;
  }

  S? get() {
    if (_tryCount < keyType.maxCounts) {
      _tryCount++;
      return null;
    } else {
      print('금고가 열렸습니다. $_data를 가져가십시오. 시도횟수 : $_tryCount');
      return _data;
    }
  }

  StrongBox({required this.keyType});
}

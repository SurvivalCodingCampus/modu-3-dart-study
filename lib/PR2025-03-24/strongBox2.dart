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
  final KeyType keyType;
  int useCount = 0;

  StrongBox({required this.keyType});

  //put은 인스턴스 저장 메서드
  void put(S data) {
    _data = data;
  }

  //get을 실행하면 useCount가 maxCountes랑 일치해지면 데이터 반환함
  S? get() {
    if (useCount < keyType.maxCounts) {
      useCount++;
      return null;
    }
    return _data;
  }
}

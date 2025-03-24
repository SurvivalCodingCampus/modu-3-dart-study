enum KeyType {
  padlock(1024),
  button(10_000),
  dial(30_000),
  finger(1_000_000);

  final int limit;     //각 키 타입의 시도 횟수 제한
  const KeyType(this.limit);   //생성자 정의
}


class StrongBox<E> {
  E? _strongBoxItem;
  final KeyType keyType;
  int _attempts = 0;

  StrongBox(this.keyType);

  void put(E item) {

    if (_strongBoxItem != null) {
      //print('금고에는 하나의 아이템만 담을 수 있습니다.');
      return;
    }
    _strongBoxItem = item;
  }

  E? get() {

    _attempts++;

    if (_strongBoxItem == null) {
     //print('금고에는 아이템이 없습니다.');
      return null;
    }

    if (_attempts < keyType.limit){
      return null;   //아직 열수 없는 상태임.
    }
    return _strongBoxItem;
  }
}


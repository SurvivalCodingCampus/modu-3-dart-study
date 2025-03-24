void main() {
  Pocket<String> pocket = Pocket();
  pocket.put('사탕');
  pocket.get();
}

// class Pocket<E> {
// 이용가능한 타입의 제약을 추가가능
class Pocket<E extends Object> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    print(_data);
    return _data;
  }
}

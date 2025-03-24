class StrongBox<S> {
  S? _data;

  // put은 인스턴스 저장 메서드
  void put(S data) {
    _data = data;
  }

  // get은 인스턴스를 얻는 메서드
  S? get() {
    return _data;
  }

  // 생성자 (초기값을 선택적으로 받을 수 있도록 수정)
  StrongBox([S? data]) : _data = data;
}

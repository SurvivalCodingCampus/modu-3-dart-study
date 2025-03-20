abstract interface class Thing {
  // property 메서드의 일종
  // int damage; 이거는 필드
  // 프로퍼티만 있되 값은 넣지 않기
  double get weight; // 추상 프로퍼티. 메서드의 일종
  set weight(double value);
}
import '../solution2/a.dart';
import '../solution2/b.dart';
import '../solution2/y.dart';

void main() {
  // 변수 타입 Y나 X로 담을 수 있음
  final List<Y> list = [];

  list.add(A());
  list.add(B());

  // 각자의 A 인스턴스, B 인스턴스가 재정의 (override) 하고 있는 b() 의 method 의 값이 다르다.
  // 동일한 부모 클래스 타입의 list 로 담아도 인스턴스는 각 클래스의 정의를 따른다.
  for (var alphabet in list) {
    alphabet.a();
  }
}

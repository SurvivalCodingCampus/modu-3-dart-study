import '../problem2/problem.dart';

List<Y> yList = []; //3-1 답 : Y 타입

Y ya = A();
Y yb = B();

void main() {
  yList.add(ya);
  yList.add(yb);

  for (var e in yList) {
    e.b();
  }
}

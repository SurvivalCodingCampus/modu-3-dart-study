import 'b.dart';
import 'xy.dart';

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

void main() {
  Y y1 = A();
  Y y2 = B();

  y1.a();
  y2.a();

  List alp = <Y>[];
  alp.add(A());
  alp.add(B());

  for (Y item in alp) {
    item.b();
  }

  List<Y> abList = [A(), B()];

   // List의 요소를 순회하며 b() 호출
  for (Y item in abList) {
    item.b();
  }
}
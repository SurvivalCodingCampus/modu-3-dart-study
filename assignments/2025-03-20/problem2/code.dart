import 'package:modu_3_dart_study/2025-03-20/problem2/problem.dart';

void main() {
  X obj = A();

  //2-1 답 : X라는 인터페이스와 Class A의 공통된 메소드가 a() 밖에 없기 때문에
  obj.a();

  Y y1 = A();
  Y y2 = B();

  //2-2
  y1.a(); //Aa
  y2.a(); //Ba
}

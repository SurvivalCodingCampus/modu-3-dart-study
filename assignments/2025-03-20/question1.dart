//연습문제 2-1
import 'polymorphism.dart';

void main() {
  X obj = A();
  Y obj2 = A();
  //예상 : obj.a(), obj.b(), obj.c() 이 둘만 될것같다.
  //실제 : 결과값은 a만 불러올 수 있음
  //이유: A로 객체화를 했지만 X로 선언을 했기때문에 X에 있는 것만 사용할 수 있어서
  obj.a();
  obj2.a();
  obj2.b();
}

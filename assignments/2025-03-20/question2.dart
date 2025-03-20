//연습문제 2-2
import 'polymorphism.dart';

void main() {
  //Y로 선언을 했기 때문에 a와 b 메서드만 사용 가능함
  Y y1 = A();
  Y y2 = B();
  //예상 : Aa  ,  정답 : Aa
  y1.a();
  //예상 : Ba  ,  정답 : Ba
  y2.a();
}

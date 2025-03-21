import '../연습문제 2/a.dart';
import '../연습문제 2/b.dart';
import '../연습문제 2/y.dart';

void main() {

  A a = A();
  B b = B();

  List<Y> data = [a,b];

  data.forEach((item){
    item.b();
  });
}
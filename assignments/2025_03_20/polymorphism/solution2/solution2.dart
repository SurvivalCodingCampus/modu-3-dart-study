import 'a.dart';
import 'b.dart';
import 'x.dart';
import 'y.dart';

void main() {
  // X 타입의 A 인스턴스 생성
  X obj = A();

  // Y 타입의 A 인스턴스 1개, B 인스턴스 1개 생성
  Y y1 = A();
  Y y2 = B();

  // a method 만 사용 가능 나머지는 불가능
  obj.a();
  // obj.b();
  // obj.c();

  // 그 이유는 컴파일 시점에 X 타입이 가지고 있는 method 만 알고 A class 에 새로 정의한 method 는 알 수 없음.

  // y1 의 a method 는 Aa 의 값을 도출.
  y1.a();
  // y2 의 a method 는 Ba 의 값을 도출.
  y2.a();

  // 그 이유는 y1 은 X 에서 뿌려준 a method 를 각각 따로 override 해서 값을 바꿨기 때문
  // A 인스턴스는 Aa, B 인스턴스는 Bb 로 override.
}

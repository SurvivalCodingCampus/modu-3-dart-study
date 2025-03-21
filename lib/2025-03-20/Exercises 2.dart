


abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

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

class B extends Y {

  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {

  print('연습문제 2_1');
  X obj = A();   // obj.a(); 만 호출  출력 Aa
  obj.a();
  //obj.b();  //error
  //obj.c();   //error

  print('연습문제 2_2');
  Y y1 = A();
  Y y2 = B();

  y1.a();            //Aa
  y2.a();            //Ba

  //추가 테스트
  //y1.b();            //Ab
  //y2.b();            //Bb

  print('연습문제 3');

  final y = <Y>[];
  y.add(A());
  y.add(B());

  y.forEach((x){
    x.b();
  });
       // Ab, Bb

}
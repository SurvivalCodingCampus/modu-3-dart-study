abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  void a() {
    print('Aa');
  }

  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  void a() {
    print('Ba');
  }

  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  X obj = A();

  obj.a(); // A중 X기능만 불러옴
  //obj.b();  불가능
  //obj.c(); 뷸가능

  Y y1 = A();
  Y y2 = B();

  y1.a(); //A중 a
  y2.a(); // B중 a

  y1.b();
  y2.b();

  //y1.c(); -> 불가능(c는 y에 없음)
  //y2.c();
}

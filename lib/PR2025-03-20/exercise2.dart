abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

abstract interface class Alphabet {
  void b() {}
}

class A extends Y implements Alphabet {
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

class B extends Y implements Alphabet {
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

//연습문제 2-1
// void main() {
//   X obj = A();
//   Y obj2 = A();
//   //obj.a(), obj.b(), obj.c() 이 둘만 될것같다.
//   //실제 결과값은 a만 불러올 수 있음
//   //이유: A로 객체화를 했지만 X로 선언을 했기때문에 X에 있는 것만 사용할 수 있어서
//   obj.a();
//   obj2.a();
//   obj2.b();
// }

//연습문제 2-2
// void main() {
//   //Y로 선언을 했기 때문에 a와 b 메서드만 사용 가능함
//   Y y1 = A();
//   Y y2 = B();
//   //예상 : Aa  ,  정답 : Aa
//   y1.a();
//   //예상 : Ba  ,  정답 : Ba
//   y2.a();
// }

//연습문제 3 : A,B클래스의 인스턴스를각각 1개씩 생성하여 List로 차례로 담는다
void main() {
  final alphabet = <Alphabet>[];
  alphabet.add(A());
  alphabet.add(B());
  alphabet.forEach((alphabet) {
    alphabet.b();
  });
}

import 'dart:core';

abstract interface class Drawable {
  void draw();
}

class Dog implements Drawable {
  void bark() {
    print('멍멍');
  }

  @override
  void draw() {
    print('멍멍이그림');
  }
}

class Person implements Drawable {
  void sayHello() {
    print("hello");
  }

  @override
  void draw() {
    print('사람그림');
  }
}

abstract class Monster {
  void run() {
    print('뚜벅뚜벅');
  }
}

class Slime extends Monster {
  final String suffix;

  //슬라임 이름
  Slime(this.suffix);

  //상위인 Monster클래스에서 run메서드를 오버라이딩함
  @override
  void run() {
    print('slime $suffix 가 도망쳤다');
  }
}

void main() {
  Drawable person = Person();
  Drawable dog = Dog();
  //dog.bark()가 불가능함
  dog.draw();
  person.draw();
  Slime slime = Slime('A');
  //여기서 Slime으로 설정했기때문에, 즉 monster의 실체는 Slime이라
  //Monster는 추상클래스라 객체화 불가, 객체화란 아래처럼 클래스로 선언하는것
  Monster monster = Slime('B');
  //둘다 오버라이드 된 slime의 run으로 결과 출력됨.
  slime.run();
  monster.run();
  // ignore: unused_local_variable
  Slime slime2 = monster as Slime;

  Monster monster2 = Slime('슬라임');
  //monster2를 슬라임으로
  if (monster2 is Slime) {
    Slime slime = monster2;
  }
}

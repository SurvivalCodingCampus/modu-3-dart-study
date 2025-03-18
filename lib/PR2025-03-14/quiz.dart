// class Hero {
//   static const String name;
//   int power = 500;
//
//   Hero({required this.name, this.power});
// }
//
// void main() {
//   Hero hero = Hero();
// }

// class Hero {
//   final String name;
//
//   Hero({required this.name});
// }
//
// void main() {
//   Hero hero1 = Hero(name: "Batman");
// }

// void main() {
//   int age;
//   age = 10;
//   age = 11;
//   final int weight;
//   final int hp =50;
//   weight = 60;
//   weight = 65; //오류발생 final은 한번 값 할당되면 값 변경이 안됨
//   const int height; // const는 컴파일 시점에 값이 결정됨 즉 height가 컴파일 시점에서 비어있기 때문에 오류 발생
//   const String name = '현수';
//   height = 20; // 컨스트는 한번 값으 대입하면 변경이 안됨
//   height = 30; // 컨스트는 한번 값으 대입하면 변경이 안됨
//   static int money = 1000; // static은 클래스의 하지만 이곳에 클래스는 없음 클래스 안에다 사용하는 문법임 static
// }
// 용어와 관련된 dart.dev를 찾아보기 단어정리를 해보기

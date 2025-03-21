import 'package:modu_3_dart_study/2025-03-20/character.dart';
import 'package:modu_3_dart_study/2025-03-20/drawable.dart';

void main() {
  final Drawable element = House(
    address: '서울시 용산구',
    size: 100,
    color: 'Color.white',
  );

  final List<Drawable> elements = <Drawable>[
    Dog(name: '멍멍이', age: 1),
    House(address: '서울 강남구', size: 10, color: 'white'),
    Tree(height: 5.0),
  ];

  // final Drawable drawable = Rectangle(
  //   width: 100,
  //   height: 50,
  //   color: 'Color.blue',
  //   borderStyle: 'BorderStyle.dashed',
  // );

  // final Drawable d = elements[1];
  final Drawable drawable = elements[0];

  switch (drawable) {
    case Rectangle():
      print('사각형이 선택됨');
      break;
    case House():
      print('집이 선택됨');
      break;
    case Dog():
      print('개가 선택됨');
      break;
  }

  drawable.draw();

  Character character = Hero(name: '홍길동', hp: 100);
  // Sword sword = Hero(name: 'name', hp: 100);

  Human human = Dancer('이름', 100);
}

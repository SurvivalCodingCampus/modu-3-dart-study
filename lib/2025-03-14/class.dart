import '../game/hero.dart';

void main() {
  String name1 = '홍길동';
  String name2 = name1;

  print(name1);
  print(name2);

  int age1 = 10;
  int age2 = age1;

  print(age1);
  print(age2);

  Hero hero1 = Hero(name: '홍길동', hp: 100);
  Hero hero2 = hero1;
  hero2.hp = 200;

  print(hero1.hp);

  Person person = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');
}

class Person {
  String name;

  Person({required this.name});
}


// top leve 변수
String topLevelName = '홍길동';


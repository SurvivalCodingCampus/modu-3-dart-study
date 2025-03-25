import 'package:modu_3_dart_study/2025-03-21/object.dart';

// Dart에서 복사를 하려면?
// 해당 클래스에 copyWith 메서드 구현
void main() {
  final person1 = Person(name: '슈퍼맨', age: 10, address: Address('서울시'));
  final person2 = person1; // 얕은 복사

  print(identical(person1, person2)); // ture
  print(person1 == person2); // ture

  person2.age = 20; // person2의 age를 변경
  print(person1.age); // person1의 age도 20 (같은 객체이기 때문에)

  // copyWith로 얕은복사하기
  // -> 근데 독립적인 객체임 그래서 값이 달라 질 수 있지만
  // -> 깊은 복사는 또 아님;
  // 왜냐 내부값만 단순히 복사해 온거고
  final person3 = person1.copyWith(age: 30); // age만 변경하여 새로운 객체 생성
  print(person3); // Person(name: 슈퍼맨, age: 30, address: 서울시)
  print(person1); //Person(name: 슈퍼맨, age: 20, address: 서울시)

  print(identical(person1, person3)); // false

  final person4 = person1.copyWith(address: Address('서울시'));

  print(person1);
  print(person4);
  print(identical(person1, person4)); // false

  person1.address.street = '수원시';
  print(person1.address.street); // 얕은 복사가 맞음 -> address값 복사해왔지 address을 복사한게 아님
  print(person1);
  print(person4);
}

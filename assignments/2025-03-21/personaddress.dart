class Address {
  String street;

  Address(this.street);

  Address deepCopy() => Address(street); // 깊은 복사 메서드
}

class Person {
  final String name;
  final int age;
  Address address;

  Person(this.name, this.age, this.address);

  //얕은 복사 메서드
  Person shallowCopy() => Person(name, age, address);

  //깊은 복사 메서드
  Person deepCopy() => Person(name, age, address.deepCopy());
}

void main() {
  final person1 = Person('홍길동', 20, Address('서울시 강남구'));
  final person2 = person1.shallowCopy();

  print(identical(person1, person2)); // false , person1과 person2는 다른 객체임
  print(
    identical(person1.address, person2.address),
  ); // true -> 주소가 같음(객체가 같은 참조)

  person1.address.street = '서울시 강서구';

  print(person1.address.street); //서울시 강서구
  print(person2.address.street); //서울시 강서구

  final person3 = person1.deepCopy();
  print(identical(person1, person3)); // false
  print(identical(person1.address, person3.address)); // false -> 주소가 다름
}

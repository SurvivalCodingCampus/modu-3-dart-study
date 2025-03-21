class Address {
  String street;

  Address(this.street);
}

class Person {
  String name;
  final int age;
  final Address address;

  Person({required this.name, required this.age, required this.address});

  Person copyWith({String? name, int? age, Address? address}) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }
}

void main() {
  final person1 = Person(name: '김', age: 10, address: Address('오산시'));
  final person2 = person1.copyWith(address: Address('오산시'));

  print(identical(person1, person2));
  print(identical(person1.address, person2.address)); // ?

  person1.address.street = '서울시';
  print(person2.address.street);

  // person1.name = '박';
  // print(person2.name);


  // age는 그대로 이름만 박
  final person3 = person1.copyWith(name: '박');

  // 이름은 그대로 나이만 바꿔서 새로 생성
  final person4 = person1.copyWith(age: 20);

}
class Address {
  String street;

  Address(this.street);

  @override
  String toString() => street;
}

class Person implements Comparable {
  String name;
  int age;
  final Address address;

  Person({required this.name, required this.age, required this.address});

  Person copyWith({String? name, int? age, Address? address}) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.name == name &&
        other.age == age &&
        other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ address.hashCode; // 이름과 나이를 합쳐서 번호를 만든다.

  @override
  String toString() => 'Person(name: $name, age: $age, address: $address)';

  @override
  int compareTo(dynamic other) {
    return age.compareTo(other.age); // 나이 기준으로 오름차순 정렬
  }
}

void main() {
  Person p1 = Person(name: 'Alice', age: 14, address: Address('서울시'));
  Person p2 = Person(name: 'Alice', age: 14, address: Address('서울시'));

  // toString()
  // - 문자열 표현을 얻을 수 있음
  //    오버라이드    |  안함               | 함                            |
  print(p1); // Instance of 'Person'    | Person(name: Alice, age: 14)  |
  print(p1.toString()); //   print(p1); 와 같은 결과값을 가져옴

  // * operator (equality를 판단 또는 재정의함)
  // => 동등을 판별
  // - operator 없을 때는 동등한 객체로 보지 않음
  // - operator가 이름과 나이가 값으면 동등한 객체로 간주
  //    오버라이드              |  안함        | 함         |
  print(p1 == p2); //           false      | ture       |
  print(identical(p1, p2)); //  false      | false      |

  // * identical(a,b)
  // => 동일을 판별
  // - a와 d가 동일한 객체인지 확인하는 메소드
  // - 동일한 메모리 주소를 참조하는지, 즉 같은 객체인지 확인하는데 사용

  // * hashCode() 오버라이드
  // => 내용이 같으면 동일하다고 만들어줌
  //
  //             오버라이드  |  안함        | 함          |
  print(p1.hashCode); //     283145760  | 210235893  |
  print(p2.hashCode); //     230187668  | 210235893  |
  // -> 내용이 같다고 판단되는 객체 즉 동등한 객체를 하나의 주소로 넣을 수 있게

  // * List 와 Set으로 확인해 보기
  // 같은 내용이라 operator 가 동등하다고 판단하고 지워버림
  // 만약 operator를 오버라이딩 안했다?
  // -> 지우지 않음!
  final personsList = <Person>[]; // List

  personsList.add(p1);
  print(personsList.length);
  personsList.remove(p2);
  print(personsList.length);

  final personsSet = <Person>{}; // Set
  //             오버라이드  |  안함     | 함        |
  personsSet.add(p1);
  print(personsSet.length); // 1     | 1
  personsSet.add(p2);
  print(personsSet.length); // 2     | 1 => 동등하니까 중복을 받지 않음
  personsSet.remove(p2);
  print(personsSet.length); // 1    | 0
}

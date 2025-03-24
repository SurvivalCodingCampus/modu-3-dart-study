import 'package:collection/collection.dart';
import 'address.dart' show Address;

class Person implements Comparable<Person> {
  String name;
  Address address;

  Person({required this.name, required this.address});

  Person copyWith({String? name, Address? address}) =>
      Person(name: name ?? this.name, address: address ?? this.address);

  @override
  bool operator ==(Object other) =>
      other is Person && name == other.name ? true : false;

  @override
  int get hashCode => name.hashCode;

  @override
  int compareTo(Person other) {
    return name.compareTo(other.name);
  }

  @override
  toString() {
    return 'Person(name: $name)';
  }
}

void main() {
  Person a = Person(name: 'A', address: Address('A'));
  Person b = a.copyWith();

  print(a == b);
  List<Person> list = [];

  list.add(a);
  list.add(b);

  print('${list.length}');
  print('identical(a, b) = ${identical(a, b)}');

  List<Person> c = list.sortedBy((Person element) => element.name);
  print(c);
}

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/2025-03-21/object.dart';

void main() {
  // List.sort() 메서드
  List<int> numbers = [5, 2, 8, 1, 3];

  // 내림차순 정렬
  numbers.sort((a, b) {
    if (a == b) return 0;
    if (a < b) return 1; // 큰 값이 앞에 오도록 설정
    return -1;
  });
  print("내림차순: $numbers");

  // 오름차순 정렬
  numbers.sort((a, b) {
    if (a == b) return 0;
    if (a < b) return -1; // 작은 값이 앞에 오도록 설정
    return 1;
  });
  print("오름차순: $numbers");

  // Comperable 인테페이스로
  // 이렇게 간단하게도 할 수 있으나
  // 문제점! 원본을 보호하지 못한다.
  numbers.sort((a, b) => a.compareTo(b)); // 오름차순
  print(numbers);
  numbers.sort((a, b) => b.compareTo(a)); // 내림차순
  print(numbers);
  // int, double, String 등의 타입은 Comparable을 이미 구현되어 있음

  final persons = <Person>[];
  final p1 = Person(age: 18, name: '애순', address: Address('서울시'));
  final p2 = Person(age: 19, name: '관식', address: Address('서울시'));
  final p3 = Person(age: 18, name: '애순', address: Address('서울시'));

  persons.add(p1);
  persons.add(p2);
  persons.add(p3);

  // * sort() 사용하기
  // !! Person 은 Comperable 인테페이스를 상속받고
  // compareTo() 오버로드 의해 정렬
  print('compareTo 호출 전:$persons');
  persons.sort(); // compareTo()에 의해 정렬
  print('compareTo 호출 후:$persons'); // 오름차순 정렬

  // 패키지 collection 사용하는 것을 추천한다.
  // why?
  // - 원본은 그대로 두고 복사본을 반환하는 다양한 기능이 있다
  final ascendingSortedNames = numbers.sorted((a, b) => a.compareTo(b));
  print(ascendingSortedNames); // 오름차순
  final decendingSortedNames = numbers.sorted((a, b) => b.compareTo(a));
  print(decendingSortedNames); // 내림

  final byName = persons.toList()..sort((a, b) => a.name.compareTo(b.name));
  final byAge = persons.toList()..sort((a, b) => a.age.compareTo(b.age));
  final byAgeDesc = persons.toList()..sort((a, b) => b.age.compareTo(a.age));

  print(byName);
  print(byAge);
  print(byAgeDesc);

  // final byNamePerspn =
  //     persons.toList()..sort((a, b) => a.name.compareTo(b.name));
  // List<Person> ascendingSortedByNamePerspn = persons.sortedBy(
  //   (persons) => persons.name,
  // );

  persons.sort();
  print(persons);
}

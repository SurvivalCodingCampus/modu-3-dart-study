import 'package:collection/collection.dart';

import '../2025-03-18/hero.dart';

void main() {
  List<String> names = [
    '홍길동',
    '김삿갓',
    '신사임당'
  ];

  List<int> numbers = [1, 3, 2];

  // 오름차순 정렬
  numbers.sort((a, b) => a.compareTo(b));
  print(names);

  List<String> sortedNames = names.sorted();
  List<Hero> heroList = [];

  // 오름차순 짧게 쓰는 법
  List<Hero> ascendingSortedByNameHeroList = heroList.sortedBy((hero) => hero.name);

}
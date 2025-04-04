class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transaction = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // 1. 2011년에 일어난 모든 거래를 찾아 값을 오름차순으로 정렬하시오.
  final result1 = transaction
      .where((element) => element.year == 2011)
      .toList()
        ..sort((a, b) => a.value.compareTo(b.value));
  print(result1);

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오.
  final result2 = transaction.map((e) => e.trader.city).toSet();
  print(result2);

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오.
  final result3 = transaction
      .where((element) => element.trader.city == 'Cambridge')
      .map((e) => e.trader.name)
      .toSet()
      .toList()
        ..sort();
  print(result3);

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬해서 나열하시오.
  final result4 = transaction.map((e) => e.trader.name).toSet().toList()..sort();
  print(result4);

  // 5. 밀라노에 거래자가 있는가?
  final result5 = transaction.any((element) => element.trader.city == 'Milan');
  print(result5);

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오.
  final result6 = transaction
      .where((element) => element.trader.city == 'Cambridge')
      .map((e) => e.value)
      .toList();
  print(result6);

  // 7. 전체 트랜잭션 중 최댓값은 얼마인가?
  final result7 = transaction.map((e) => e.value).reduce((value, element) => value > element ? value : element);
  print(result7);

  // 8. 전체 트랜잭션 중 최솟값은 얼마인가?
  final result8 = transaction.map((e) => e.value).reduce((value, element) => value < element ? value : element);
  print(result8);
}
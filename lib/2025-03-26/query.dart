import 'package:collection/collection.dart';

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

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  final result1 =
      transactions
          .where((element) => element.year == 2011)
          .sorted((a, b) => a.value.compareTo(b.value))
          .map((element) => element.trader.name)
          .toList();

  print('1번 문제: $result1');
  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  final result2 =
      transactions.map((element) => element.trader.city).toSet().toList();
  print('2번 문제: $result2');

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  final result3 =
      transactions
          .map((element) => element.trader)
          .where((element) => element.city == 'Cambridge')
          .toSet()
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name));

  print('3번 문제: ${result3.map((element) => element.name).toList()}');

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final result4 =
      transactions.map((t) => t.trader.name).toSet().toList()..sort();

  print('4번 문제: $result4');

  // 5. 밀라노에 거래자가 있는가?

  final result5 = transactions.any((element) => element.trader.city == 'Milan');

  print('5번 문제: $result5');

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오

  final result6 = transactions
       .where((element) => element.trader.city == 'Cambridge')
       .map((element) => element.value)
       .toList();
  print('6번 문제: $result6');

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final result7 = transactions
      .map((element) => element.value)
      .reduce((a, b) => a > b ? a : b);

  print('7번 문제: $result7');

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final result8 = transactions
      .map((element) => element.value)
      .reduce((a, b) => a < b ? a : b);

  print('8번 문제: $result8');
}

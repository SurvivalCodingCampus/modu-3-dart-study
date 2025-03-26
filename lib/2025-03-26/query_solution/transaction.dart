import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trader &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          city == other.city;

  @override
  int get hashCode => name.hashCode ^ city.hashCode;

  @override
  String toString() => '{ name: $name, city: $city }';
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
  print("--------------------------------------------------");
  print("1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오");

  final result1 = transactions
      .where((t) => t.year == 2011)
      .toList()
      .sorted((a, b) => a.value.compareTo(b.value))
      .map((tr) => tr.trader.name);
  print(result1);

  print("--------------------------------------------------");
  print("2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오");
  final result2 = transactions.map((t) => t.trader.city).toSet();
  print(result2);

  print("--------------------------------------------------");
  print("3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오");
  final result3 = transactions
      .map((t) => t.trader)
      .where((td) => td.city == 'Cambridge')
      .toSet()
      .toList()
      .sorted((a, b) => a.name.compareTo(b.name));

  print(result3.toString());

  print("--------------------------------------------------");
  print("4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오");

  final result4 =
      transactions.map((t) => t.trader.name).toSet().toList().sorted();
  print(result4);

  print("--------------------------------------------------");
  print("5. 밀라노에 거래자가 있는가?");
  final result5 = transactions.any((t) => t.trader.city == 'Milan');
  print(result5);

  print("--------------------------------------------------");
  print("6. 케임브리지에 거주하는 거래자의 모든 트랜잭션 값을 출력하시오");
  final result6 = transactions
      .where((t) => t.trader.city == 'Cambridge')
      .map((tr) => tr.value);
  print(result6);

  print("--------------------------------------------------");
  print("7. 전체 트랜잭션 중 최대값은 얼마인가?");
  final result7 = transactions.map((tx) => tx.value).reduce(max);
  print(result7);

  print("--------------------------------------------------");
  print("8. 전체 트랜잭션 중 최소값은 얼마인가?");
  final result8 = transactions.map((tx) => tx.value).reduce(min);
  print(result8);
}

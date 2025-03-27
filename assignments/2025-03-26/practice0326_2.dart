import 'dart:core';
import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trader && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
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
  //2011년 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순 정리하여 이름 나열
  print('Question1');
  var result1 =
      transactions
          .where((e) => e.year == 2011)
          .sorted((a, b) => a.value.compareTo(b.value))
          .map((e) => e.trader.name)
          .toList();
  print(result1);
  print('-------');

  print('Question2');
  //거래자가 근무하는 모든 도시를 중복 없이 나열 ->  toSet.
  var result2 = transactions.map((e) => e.trader.city).toSet();
  print(result2);
  print('-------');
  print('Question3');
  // 케임브리지에서 근무(where)하는 모든 거래자를 찾아서(map) 이름순(sorted)으로 정렬 (List)하여  나열하시오
  var result3 =
      transactions
          .map((e) => e.trader)
          .where((e) => e.city == 'Cambridge')
          .sorted((a, b) => a.name.compareTo(b.name))
          .toSet()
          .toList();
  print(result3);
  print('-------');
  print('Question4');
  //모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  var result4 = transactions
      .map((e) => e.trader.name)
      .toSet()
      .toList()
      .sorted((a, b) => a.compareTo(b));
  print(result4);
  print('-------');
  print('Question5');
  //밀라노에 거래자가 있는가?
  var result5 = transactions.any((e) => e.trader.city == 'Milan');
  print(result5);
  print('-------');
  print('Question6');
  // 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  transactions
      .where((e) => e.trader.city == 'Cambridge')
      .map((e) => e.value)
      .forEach(print);
  print('-------');
  print('Question7');
  // 전체 트랜잭션 중 최대값은 얼마인가?
  var result7 = transactions.map((e) => e.value).reduce((v, e) => max(v, e));
  print(result7);
  print('---------');
  print('Question8');
  // 전체 트랜잭션 중 최소값은 얼마인가?
  var result8 = transactions.map((e) => e.value).reduce((v, e) => min(v, e));
  print(result8);
}

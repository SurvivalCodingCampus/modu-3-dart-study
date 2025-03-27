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
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          trader == other.trader &&
          year == other.year &&
          value == other.value;

  @override
  int get hashCode => trader.hashCode ^ year.hashCode ^ value.hashCode;

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

void main(){

  //for (int i=0; i<transactions.length; i++) {
  //  print(transactions[i].toString());
  //}

  // 문제풀이
  print('1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오.');
  print(transactions
      .where((transactions) => transactions.year == 2011)
      .toList()
      .sorted((a, b) => a.value.compareTo(b.value))
      .map((trader) => trader.trader.name));

  print('\n2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오.');
  print(transactions
      .map((transactions) => transactions.trader.city)
      .toSet());

  print('\n3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오.');
  print(transactions
      .where((transactions) => transactions.trader.city == 'Cambridge')
      .toList()
      .sorted((a, b) => a.trader.name.compareTo(b.trader.name))
      .map((trader) => trader.trader.name)
      .toSet());

  print('\n4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오.');
  print(transactions
      .map((transactions) => transactions.trader.name)
      .toSet()
      .sorted((a, b) => a.compareTo(b))
  );

  print('\n5. 밀라노에 거래자가 있는가?.');
  print(transactions
      .where((transactions) => transactions.trader.city == 'Milan')
      .toList()
      .isNotEmpty);

  print(transactions
      .any((transactions) => transactions.trader.city == 'Milan'));

  print('\n6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오.');
  print(transactions
      .where((transactions) => transactions.trader.city =='Cambridge')
      .map((transactions) => transactions.value));

  print('\n7. 전체 트랜잭션 중 최대값은 얼마인가?.');
  print(transactions
      .map((transactions) => transactions.value)
      .max
  );

  print(transactions
      .map((transactions) => transactions.value)
      .reduce(max)
  );


  print('\n8. 전체 트랜잭션 중 최소값은 얼마인가?.');
  print(transactions
      .map((transactions) => transactions.value)
      .reduce(min)
  );

}
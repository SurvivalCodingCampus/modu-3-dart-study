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
}

class Transaction {
  Trader trader;
  int year;
  int value;

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }

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
  print('1번');
  print(
    transactions
        .where((e) => e.year == 2011)
        .sorted((a, b) => a.value.compareTo(b.value))
        .map((e) => e.trader.name),
  );
  print('2번');
  print(transactions.map((e) => e.trader.city).toSet());
  print('3번');
  print(
    transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .sorted((a, b) => a.compareTo(b))
        .toSet()
  );
  print('4번');
  print(
    transactions
        .map((e) => e.trader.name).sorted((a, b) => a.compareTo(b)).toSet()
  );
  print('5번');
  print(
    transactions.any((e) => e.trader.city == 'Milan')
  );
  print('6번');
  print(
    transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.value)
  );
  print('7번');
  print(
      transactions
          .map((e) => e.value)
          .reduce((v, e) => max(v, e))
  );
  print('8번');
  print(
      transactions
          .map((e) => e.value)
          .reduce((v, e) => min(v, e))
  );
}

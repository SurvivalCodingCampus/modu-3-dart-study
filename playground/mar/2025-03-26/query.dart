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

  Transaction(this.trader, this.year, this.value);

  //1
  static List<String> transactionsPriceSort(List<Transaction> transactions) {
    final result =
        transactions
            .where((e) => e.year == 2011)
            .sorted((a, b) => a.value.compareTo(b.value))
            .map((e) => e.trader.name)
            .toList();

    return result;
  }

  //2
  static Set<String> traderCity(List<Transaction> transactions) {
    // final result = <String>{};
    // for (int i = 0; i < transactions.length; i++) {
    //   result.add(transactions[i].trader.city);
    // };
    final result = transactions.map((e) => e.trader.city).toSet();

    return result;
  }

  //3
  static Set<String> cambridgeTraderSort(List<Transaction> transactions) {
    final result =
        transactions
            .where((e) => e.trader.city == 'Cambridge')
            .sorted((a, b) => a.trader.name.compareTo(b.trader.name))
            .map((e) => e.trader.name)
            .toSet();

    return result;
  }

  //4
  static Set<String> traderName(List<Transaction> transactions) {
    final result = transactions.map((e) => e.trader.name).toSet();
    return result;
  }

  //5
  static bool traderInMilan(List<Transaction> transactions) {
    final result = transactions.any((e) => e.trader.city == 'Milan');

    return result;
  }

  //6
  static int cambridgeSumTransactionValue(List<Transaction> transactions) {
    final result = transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.value)
        .reduce((v, e) => v + e);
    return result;
  }

  //7
  static int maxTransactionValue(List<Transaction> transaction) {
    final result = transaction.map((e) => e.value).reduce((v, e) => max(v, e));

    return result;
  }

  //8
  static int minTransactionValue(List<Transaction> transaction) {
    final result = transaction.map((e) => e.value).reduce((v, e) => min(v, e));

    return result;
  }

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
}

void main() {
  final transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];
  final result1 = Transaction.transactionsPriceSort(transactions);
  final result2 = Transaction.traderCity(transactions);
  final result3 = Transaction.cambridgeTraderSort(transactions);
  final result4 = Transaction.traderName(transactions);
  final result5 = Transaction.traderInMilan(transactions);
  final result6 = Transaction.cambridgeSumTransactionValue(transactions);
  final result7 = Transaction.maxTransactionValue(transactions);
  final result8 = Transaction.minTransactionValue(transactions);

  print('1번: $result1');
  print('2번: $result2');
  print('3번: $result3');
  print('4번: $result4');
  print('5번: $result5');
  print('6번: $result6');
  print('7번: $result7');
  print('8번: $result8');
}

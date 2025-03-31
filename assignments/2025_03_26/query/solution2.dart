import 'dart:math';

import 'package:collection/collection.dart';

import 'trader.dart';
import 'transaction.dart';

void main() {
  final transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  // 1
  print('----------1번 문제----------');
  transactions
      .where((element) => element.year == 2011)
      .toList()
      .sorted((a, b) => a.value.compareTo(b.value))
      .map((e) => e.trader.name)
      .forEach(print);

  // 2
  print('----------2번 문제----------');
  transactions.map((e) => e.trader.city).toSet().forEach(print);

  // 3
  print('----------3번 문제----------');

  transactions
      .where((element) => element.trader.city == 'Cambridge')
      .map((e) => e.trader.name)
      .toList()
      .sorted()
      .toSet()
      .forEach(print);

  // 4
  print('----------4번 문제----------');

  transactions.map((e) => e.trader.name).toSet().sorted().forEach(print);

  // 5
  print('----------5번 문제----------');
  bool isMilan = transactions.any((element) => element.trader.city == 'Milan');
  print(isMilan);

  // 6
  print('----------6번 문제----------');
  transactions
      .where((element) => element.trader.city == 'Cambridge')
      .map((e) => e.value)
      .forEach(print);

  // 7
  print('----------7번 문제----------');

  final maxValue = transactions.map((e) => e.value).reduce(max);
  print(maxValue);
  // 8
  print('----------8번 문제----------');
  final minValue = transactions.map((e) => e.value).reduce(min);
  print(minValue);
}

import 'dart:math';
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
  print('1️⃣. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오');
  final List<String> transactionsIn2011 =
      transactions
          .where((e) => e.year == 2011)
          .sorted((a, b) => a.value.compareTo(b.value))
          .map((e) => e.trader.name)
          .toList();
  print('$transactionsIn2011');
  print('\n');

  print('2️⃣. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오');
  final List<String> transactionCity =
      transactions.map((e) => e.trader.city).toSet().toList();
  print('$transactionCity');
  print('\n');

  print('3️⃣. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오');
  final List<String> cambridgeTrader =
      transactions
          .where((e) => e.trader.city == 'Cambridge')
          .map((e) => e.trader.name)
          .toSet()
          .toList()
        ..sort((a, b) => a.compareTo(b));

  // List<String> cambridgeTrader2 =
  //     transactions
  //         .where((e) => e.trader.city == 'Cambridge')
  //         .map((e) => e.trader.name)
  //         .toList();
  // cambridgeTrader2.sort((a, b) => a.compareTo(b));
  /*

   .sort는
    - 원래 리스트를 정렬하지만 결과를 돌려주지 않아요 (리턴값이 없음).
    - 대신 리스트 자체를 정렬된 상태로 바꿔요.

    ..sort는
    - Cascade Operator(..)를 사용해서
    - 리스트를 정렬하고, **정렬된 리스트를 다시 반환**할 수 있어요.
    - 그래서 체이닝(겹쳐서 이용)이 가능해요! 😊

    .. 체이닝이란, 객체나 리스트에 여러 작업을 이어서 실행
        
  */
  print('$cambridgeTrader');
  // print('$cambridgeTrader2');
  print('\n');

  print('4️⃣. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오');
  final List<String> traderName =
      transactions.map((e) => e.trader.name).toSet().toList()
        ..sort((a, b) => a.compareTo(b));
  print(traderName);
  print('\n');

  print('5️⃣. 밀라노에 거래자가 있는가?');
  final bool milanTrader = transactions.any((e) => e.trader.city == 'Milan');
  print(milanTrader);
  print('\n');

  print('6️⃣. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오');
  final int cambridgeTransactionVelue = transactions
      .where((e) => e.trader.city == 'Cambridge') // 케임브리지에 거주하는 거래만 필터링
      .map((e) => e.value) // 각 거래의 값 (value)만 추출
      .reduce((v, e) => v + e);
  print(cambridgeTransactionVelue);
  print('\n');

  print('7️⃣. 전체 트랜잭션 중 최대값은 얼마인가?');
  final int TransactionMaxVelue = transactions
      .map((e) => e.value)
      .reduce((v, e) => max(v, e));
  print(TransactionMaxVelue);
  print('\n');

  print('8️⃣. 전체 트랜잭션 중 최소값은 얼마인가?');
  final int TransactioMinVelue = transactions
      .map((e) => e.value)
      .reduce((v, e) => min(v, e));
  print(TransactioMinVelue);
  print('\n');
}

import 'dart:math';

import 'query.dart';

void main() {
  //1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  List<Transaction> transactList1 =
      transactions.where((e) => e.year == 2011).toList();
  transactList1.sort((a, b) => a.value.compareTo(b.value));
  print("1. $transactList1");

  //2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오

  Set traderCity =
      transactions
          .map((transaction) => transaction.trader.city)
          .toList()
          .toSet();

  print("2. $traderCity");

  //3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  List<Trader> cambridgeTraderList =
      transactions
          .map((transaction) => transaction.trader)
          .toList()
          .where((trander) => trander.city == 'Cambridge')
          .toList();
  cambridgeTraderList.sort((a, b) => a.name.compareTo(b.name));
  print("3. $cambridgeTraderList");

  //4.모든 거래자의 이름을 알파벳순으로 정렬해서 나열하시오
  List<Trader> traderNameSortList =
      transactions.map((transaction) => transaction.trader).toList();
  traderNameSortList.sort((a, b) => a.name.compareTo(b.name));
  print("4. $traderNameSortList");

  //5. 밀라노에 거래자가 있는가?

  bool milanTrader =
      transactions
          .map((transaction) => transaction.trader)
          .toList()
          .where((trander) => trander.city == "Milan")
          .toList()
          .isNotEmpty;

  print("5. $milanTrader");

  //6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오

  List cambridgeTraderValueList =
      transactions
          .where((transaction) => transaction.trader.city == "Cambridge")
          .toList()
          .map((trander) => trander.value)
          .toList();

  print("6. $cambridgeTraderValueList");

  //7.전체 트랜잭션 중 최대값은 얼마인가? && 8.전체 트랜잭션 중 최소값은 얼마인가?
  List<int> allTraderValue =
      transactions.map((transaction) => transaction.value).toList();

  print("7. ${allTraderValue.reduce(max)}");
  print("8. ${allTraderValue.reduce(min)}");
}

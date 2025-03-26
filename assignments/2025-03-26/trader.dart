import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trader && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'name: $name, city: $city';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Transaction && trader == other.trader;

  @override
  int get hashCode => trader.hashCode;

  @override
  String toString() {
    return 'Transaction trader: ${trader.toString()}, year: $year, value: $value';
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

  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  final transactionPriceSorted = transactions.where((e) => e.year == 2011).sorted(
    (a, b) => a.value.compareTo(b.value),
  );
  printList('price sorted', transactionPriceSorted);

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  final transactionSet = transactions.toSet();
  printList('Set', transactionSet);

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  const cambridge = 'Cambridge';
  final cambridgeTransactions =
transactions.where((e) => e.trader.city == cambridge).toList();
  final cambridgeTransactionsSorted = cambridgeTransactions.sorted(
    (a, b) => a.trader.name.compareTo(b.trader.name),
  );
  printList('cambridge & name sorted', cambridgeTransactionsSorted);

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final transactionNameSorted = transactions.sorted(
    (a, b) => a.trader.name.compareTo(b.trader.name),
  );
  printList('name sorted', transactionNameSorted);

  // 5. 밀라노에 거래자가 있는가?
  const milan = 'Milan';
  final isExistMilanTrader = transactions.any((e) => e.trader.city == milan);
  print('isExistMilanTrader: $isExistMilanTrader');

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  printList('cambridge', cambridgeTransactions);

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final maxTransactionValue = transactions.reduce(TransactionMax);
  print('--------max--------');
  print(maxTransactionValue.value);

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final minTransactionValue = transactions.reduce(TransactionMin);
  print('--------min--------');
  print(minTransactionValue.value);
}

// 어떤 타입 출력인지,
// 리스트 출력
void printList(String title, Iterable<Transaction> transactions) {
  print('--------$title--------');
  transactions.forEach((e) {
    print(e.toString());
  });
}

// max 뽑아내기
Transaction TransactionMax(Transaction t1, Transaction t2) {
  return t1.value >= t2.value ? t1 : t2;
}

// min 뽑아내기
Transaction TransactionMin(Transaction t1, Transaction t2) {
  return t1.value >= t2.value ? t2 : t1;
}

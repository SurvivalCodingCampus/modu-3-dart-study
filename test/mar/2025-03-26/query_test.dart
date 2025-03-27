import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-26/query.dart';

void main() {
  final transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  test('2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열해야한다.', () {
    final result = Transaction.transactionsPriceSort(transactions);

    expect(result, equals(['Brian', 'Raoul']));
  });
  test('거래자가 근무하는 모든 도시를 중복 없이 나열하시오', () {
    final result = Transaction.traderCity(transactions);

    expect(result, equals({'Cambridge', 'Milan'}));
  });
  test('케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오', () {
    final result = Transaction.cambridgeTraderSort(transactions);

    expect(result, equals({'Alan', 'Brian', 'Raoul'}));
  });
  test('모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오', () {
    final result = Transaction.traderName(transactions);

    expect(result, equals({'Brian', 'Raoul', 'Mario', 'Alan'}));
  });
  test('밀라노에 거래자가 있는가?', () {
    final result = Transaction.traderInMilan(transactions);

    expect(result, isTrue);
  });
  test('케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오', () {
    final result = Transaction.cambridgeSumTransactionValue(transactions);

    expect(result, equals(2650));
  });
  test('전체 트랜잭션 중 최대값은 얼마인가?', () {
    final result = Transaction.maxTransactionValue(transactions);

    expect(result, equals(1000));
  });
  test('전체 트랜잭션 중 최소값은 얼마인가?', () {
    final result = Transaction.minTransactionValue(transactions);

    expect(result, equals(300));
  });
}

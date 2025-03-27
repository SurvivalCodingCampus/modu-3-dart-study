import 'dart:math';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/2025-03-26/trader.dart';
import 'package:modu_3_dart_study/2025-03-26/transaction.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final List<Transaction> transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  test('2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열해야한다.', () {
    List<String> traders =
        transactions
            .where((e) => e.year == 2011)
            .sortedBy((e) => e.value)
            .map((e) => e.trader.name)
            .toList();

    expect(traders, equals(['Brian', 'Raoul']));
  });

  test('거래자가 근무하는 모든 도시를 중복 없이 나열해야한다.', () {
    List<String> expected = ['Cambridge', 'Milan'];

    List<String> set =
        transactions.map((Transaction e) => e.trader.city).toSet().toList();

    expect(set, equals(expected));
  });

  test('케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열해야한다.', () {
    List<String> names = transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .sortedBy((name) => name);

    expect(names, equals(['Alan', 'Brian', 'Raoul', 'Raoul']));
  });

  test('모든 거래자의 이름을 알파벳순으로 정렬하여 나열해야한다.', () {
    List<String> names =
        transactions
            .map((e) => e.trader)
            .sortedBy((e) => e.name)
            .map((e) => e.name)
            .toList();

    expect(
      names,
      equals(['Alan', 'Brian', 'Mario', 'Mario', 'Raoul', 'Raoul']),
    );
  });

  test('밀라노에 거래자가 있는지 판별하고 있다면 true를 반환해야한다.', () {
    bool exist = transactions.any((e) => e.trader.city == 'Milan');
    expect(exist, isTrue);
  });

  test('케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력해야한다.', () {
    List<int> values =
        transactions
            .where((e) => e.trader.city == 'Cambridge')
            .map((e) => e.value)
            .toList();

    expect(values, equals([300, 1000, 400, 950]));
  });

  test('전체 트랜잭션 중 최대값을 출력해야한다.', () {
    int value = transactions.map((e) => e.value).reduce(max);
    expect(value, equals(1000));
  });

  test('전체 트랜잭션 중 최소값을 출력해야한다.', () {
    int value = transactions.map((e) => e.value).reduce(min);
    expect(value, equals(300));
  });
}

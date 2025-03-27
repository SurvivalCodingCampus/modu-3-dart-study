import 'dart:math';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-26/query.dart';

void main() {
  const String traderNameBrian = 'Brian';
  const String traderNameRaoul = 'Raoul';
  const String traderNameMario = 'Mario';
  const String traderNameAlan = 'Alan';
  const String cityNameMilan = 'Milan';
  const String cityNameCambridge = 'Cambridge';
  const int year2011 = 2011;
  const int year2012 = 2012;
  const int minValue = 300;
  const int maxValue = 1000;
  group('Query : ', () {
    test('2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오.', () {
      final List<String> newList =
          transactions
              .where((element) => element.year == year2011)
              .sorted((a, b) => a.value.compareTo(b.value))
              .map((e) => e.trader.name)
              .toList();

      expect(newList, equals(['Brian', 'Raoul']));
    });
    test('거래자가 근무하는 모든 도시를 중복 없이 나열하시오.', () {
      final Set<String> citySet =
          transactions.map((e) => e.trader.city).toSet();

      expect(citySet, equals({cityNameCambridge, cityNameMilan}));
    });
    test('케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오', () {
      final List<Trader> newList =
          transactions
              .where((element) => element.trader.city == cityNameCambridge)
              .sorted((a, b) => a.trader.name.compareTo(b.trader.name))
              .map((e) => e.trader)
              .toList();

      expect(newList.length, 4);
    });
    test('모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오', () {
      final List<String> newList =
          transactions
              .map((e) => e.trader.name)
              .toSet() // Remove duplicates
              .toList()
              .sorted();

      expect(
        newList,
        equals([
          traderNameAlan,
          traderNameBrian,
          traderNameMario,
          traderNameRaoul,
        ]),
      );
    });
    test('밀라노에 거래자가 있는가?', () {
      final bool milanCheck = transactions.any(
        (e) => e.trader.city == cityNameMilan,
      );

      expect(milanCheck, isTrue);
    });
    test('케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오', () {
      final List<Transaction> newList =
          transactions
              .where((element) => element.trader.city == cityNameCambridge)
              .toList();

      expect(newList.length, 4);
    });

    test('전체 트랜잭션 중 최대값은 얼마인가?', () {
      final int maxValueTransaction = transactions
          .map((e) => e.value)
          .reduce(max);

      expect(maxValueTransaction, maxValue);
    });
    test('전체 트랜잭션 중 최소값은 얼마인가?', () {
      final int minValueTransaction = transactions
          .map((e) => e.value)
          .reduce(min);

      expect(minValueTransaction, minValue);
    });
  });
}

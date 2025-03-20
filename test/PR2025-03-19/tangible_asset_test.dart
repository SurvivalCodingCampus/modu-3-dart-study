import 'package:modu_3_dart_study/PR2025-03-19/computer.dart';
import 'package:test/test.dart';

void main() {
  late Computer computer;
  setUp(() {
    computer = Computer(
      name: '그램',
      price: 10000,
      color: '흰색',
      amount: 5,
      makerName: 'LG',
    );
  });
  group('Computer클래스 생성 Test', () {
    test('computer의 name 확인 test', () {
      //given
      //when
      //then
      expect(computer.name, equals('그램'));
    });
    test('computer의 price 확인 test', () {
      //given
      //when
      //then
      expect(computer.price, equals(10000));
    });
    test('computer의 색깔 확인 test', () {
      //given
      //when
      //then
      expect(computer.color, equals('흰색'));
    });
    test('computer의 무게 확인 test', () {
      //given
      computer.weight = 2;
      //when
      //then
      expect(computer.weight, equals(2));
    });
    test('computer의 makerName 확인 test', () {
      //given
      //when
      //then
      expect(computer.makerName, equals('LG'));
    });
    test('computer의 getDiscount메서드 확인 test', () {
      //given
      //when
      computer.printSale();
      //then
      expect(computer.getDiscount(computer.price), equals(9000));
    });
  });
}

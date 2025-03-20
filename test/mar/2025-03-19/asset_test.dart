import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-19/book.dart';
import '../../../playground/mar/2025-03-19/computer.dart';
import '../../../playground/mar/2025-03-19/patent.dart';

void main() {
  group('Asset', () {
    test('TangibleAsset- Book', () {
      Book book = Book(
        name: '코테',
        price: 38000,
        color: 'Black',
        isbn: 'python',
        weight: 800,
      );

      expect(book.name, equals('코테'));
      expect(book.price, equals(38000));
      expect(book.color, equals('Black'));
      expect(book.isbn, equals('python'));
    });
    test('TangibleAsset- Computer', () {
      Computer computer = Computer(
        name: '게임',
        price: 1500000,
        color: 'Black',
        makerName: '삼성',
        weight: 1.9,
      );

      expect(computer.name, equals('게임'));
      expect(computer.price, equals(1500000));
      expect(computer.color, equals('Black'));
      expect(computer.makerName, equals('삼성'));
      expect(computer.weight, equals(1.9));
    });
    test('IntangibleAsset- Patent', () {
      Patent patent = Patent(
        name: 'AI 기술',
        price: 5000000,
        owner: '삼성전자',
        registrationNumber: 'AI-1234',
      );

      expect(patent.name, equals('AI 기술'));
      expect(patent.price, equals(5000000));
      expect(patent.owner, equals('삼성전자'));
      expect(patent.registrationNumber, equals('AI-1234'));
    });
  });
}

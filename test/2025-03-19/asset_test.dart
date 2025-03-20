import 'package:modu_3_dart_study/2025-03-19/book.dart';
import 'package:modu_3_dart_study/2025-03-19/computer.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  group('Book, Computer', () {
    const String name = '책';
    const String color = '흰색';
    const int price = 1000;
    const double weight = 500;

    const String isbn = '10';
    const String makerName = 'Dell';

    test('Book 생성 테스트', () {
      final Book book = Book(
        name: name,
        color: color,
        price: price,
        weight: weight,
        isbn: isbn,
      );

      expect(book.name, equals(name));
      expect(book.color, equals(color));
      expect(book.price, equals(price));
      expect(book.weight, equals(weight));
      expect(book.isbn, equals(isbn));
    });
    test('Computer 생성 테스트', () {
      final Computer computer = Computer(
        name: name,
        color: color,
        price: price,
        weight: weight,
        makerName: makerName,
      );
      expect(computer.name, equals(name));
      expect(computer.color, equals(color));
      expect(computer.price, equals(price));
      expect(computer.weight, equals(weight));
      expect(computer.makerName, equals(makerName));
    });

    test('Book Setter 테스트. 무게가 0보다 작을 수 없다.', () {
      final Book book = Book(
        name: name,
        color: color,
        price: price,
        weight: weight,
        isbn: isbn,
      );

      expect(() => book.weight = -0.1, throwsException);
    });
    test('Computer Setter 테스트. 무게가 0보다 작을 수 없다.', () {
      final Computer computer = Computer(
        name: name,
        color: color,
        price: price,
        weight: weight,
        makerName: makerName,
      );

      expect(() => computer.weight = -0.1, throwsException);
    });
  });
}

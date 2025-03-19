import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-19/interface_practice.dart';

void main() {
  group('TangibleAsset Tests', () {
    test('Book: 생성자 및 weight getter/setter 테스트', () {
      // Book 생성자: Book(super.name, super.price, super.color, super.weight, this.isbn)
      var book = Book("Dart Book", 100, "Blue", 1.5, "ISBN123456");

      // 생성자에 의한 초기값 검증
      expect(book.name, equals("Dart Book"));
      expect(book.price, equals(100));
      expect(book.color, equals("Blue"));
      expect(book.weight, equals(1.5));
      expect(book.isbn, equals("ISBN123456"));

      // weight setter를 통한 값 변경 검증
      book.weight = 2.0;
      expect(book.weight, equals(2.0));
    });

    test('Computer: 생성자 및 weight getter/setter 테스트', () {
      // Computer 생성자: Computer(super.name, super.price, super.color, super.weight, this.makerName)
      var computer = Computer("Laptop", 1500, "Black", 2.5, "Dell");

      // 생성자에 의한 초기값 검증
      expect(computer.name, equals("Laptop"));
      expect(computer.price, equals(1500));
      expect(computer.color, equals("Black"));
      expect(computer.weight, equals(2.5));
      expect(computer.makerName, equals("Dell"));

      // weight setter를 통한 값 변경 검증
      computer.weight = 3.0;
      expect(computer.weight, equals(3.0));
    });
  });

  group('IntangibleAsset Tests', () {
    test('Patent: 생성자 테스트', () {
      // Patent 생성자: Patent(super.name, super.price, super.owner, this.patentNumber)
      var patent = Patent("Innovative Patent", 300, "Alice", "PAT123");

      // 생성자에 의한 초기값 검증
      expect(patent.name, equals("Innovative Patent"));
      expect(patent.price, equals(300));
      expect(patent.owner, equals("Alice"));
      expect(patent.patentNumber, equals("PAT123"));
    });
  });
}
import 'package:test/test.dart';

import '../../assignments/2025-03-19/book.dart';
import '../../assignments/2025-03-19/computer.dart';

void main() {
  group('자산관리 프로그램', () {
    test('Book 클래스', () {
      final book = Book(
        name: '오준석의 플러터 생존코딩',
        price: 25000,
        color: 'Blue',
        weight: 1.2,
        isbn: '1234567890',
      );

      expect(book.name, '오준석의 플러터 생존코딩');
      expect(book.price, 25000);
      expect(book.color, 'Blue');
      expect(book.isbn, '1234567890');

      // TangibleAsset의 weight 확인
      expect(book.weight, 1.2);

      book.weight = 1.5;
      expect(book.weight, 1.5);
    });

    test('Computer 클래스', () {
      final computer = Computer(
        name: 'MacBook Pro',
        price: 2000000,
        color: 'Silver',
        weight: 1.8,
        makerName: 'Apple',
      );

      expect(computer.name, 'MacBook Pro');
      expect(computer.price, 2000000);
      expect(computer.color, 'Silver');
      expect(computer.makerName, 'Apple');

      // TangibleAsset의 weight
      expect(computer.weight, 1.8);

      computer.weight = 2.0;
      expect(computer.weight, 2.0);
    });

    test('Thing 인터페이스(Book)', () {
      final book = Book(
        name: '오준석의 플러터 생존코딩',
        price: 25000,
        color: 'Blue',
        weight: 1.2,
        isbn: '1234567890',
      );

      // Thing의 getter setterdml 기능을 하는가?
      expect(book.weight, 1.2);
      book.weight = 2.0;
      expect(book.weight, 2.0);
    });

    test('Thing 인터페이스(Computer)', () {
      final computer = Computer(
        name: 'MacBook Pro',
        price: 2000000,
        color: 'Silver',
        weight: 1.8,
        makerName: 'Apple',
      );

      // Thing의 getter setterdml 기능을 하는가?
      expect(computer.weight, 1.8);
      computer.weight = 2.0;
      expect(computer.weight, 2.0);
    });

    test('Asset 추상클래스(Book)', () {
      final book = Book(
        name: '오준석의 플러터 생존코딩',
        price: 25000,
        color: 'Blue',
        weight: 1.2,
        isbn: '1234567890',
      );
      // Asset의 필드 name, price가 가져와지는가?
      expect(book.name, '오준석의 플러터 생존코딩');
      expect(book.price, 25000);
    });

    test('Asset 추상클래스(Computer)', () {
      final computer = Computer(
        name: 'MacBook Pro',
        price: 2000000,
        color: 'Silver',
        weight: 1.8,
        makerName: 'Apple',
      );

      // Asset 필드 name, price가 가져와지는가?
      expect(computer.name, 'MacBook Pro');
      expect(computer.price, 2000000);
    });

    test('TangibleAsset 추상클래스(Book)', () {
      final book = Book(
        name: '오준석의 플러터 생존코딩',
        price: 25000,
        color: 'Blue',
        weight: 1.2,
        isbn: '1234567890',
      );

      expect(book.color, 'Blue');
      expect(book.weight, 1.2); // getter weight를 가져오는가?

      // TangibleAsset에서 정의된 getter와 setter 가져와지는가?
      book.weight = 2.0;
      expect(book.weight, 2.0);
    });

    test('TangibleAsset 추상클래스(Computer)', () {
      final computer = Computer(
        name: 'MacBook Pro',
        price: 2000000,
        color: 'Silver',
        weight: 1.8,
        makerName: 'Apple',
      );

      expect(computer.color, 'Silver');
      expect(computer.weight, 1.8); // getter weight를 가져오는가?

      // TangibleAsset에서 정의된 getter와 setter 가져와지는가?
      computer.weight = 2.0;
      expect(computer.weight, 2.0);
    });
  });
}

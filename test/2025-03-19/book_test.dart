import 'package:test/test.dart';
import '../../assignments/2025-03-19/book.dart';
import '../../assignments/2025-03-19/computer.dart';
import '../../assignments/2025-03-19/asset.dart';
import '../../assignments/2025-03-19/tangible_asset.dart';

void main() {
  group('Book 및 Computer 클래스 테스트', () {
    test('Book 생성 성공', () {
      // given
      String isbn = '12345678';
      int price = 10000;
      String color = '빨강';
      String name = '어린왕자';
      double weight = 200.0;
      DateTime purchaseDate = DateTime(2023, 5, 1);
      double salvageValue = 5000;
      String createdDate = '2023-04-01';
      String manageDepart = '도서 관리팀';
      String description = '어린왕자 책';

      // when
      Book book = Book(
        isbn: isbn,
        price: price,
        color: color,
        name: name,
        weight: weight,
        purchaseDate: purchaseDate,
        salvageValue: salvageValue,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      // then
      expect(book, isA<Book>());
      expect(book, isA<TangibleAsset>());
      expect(book, isA<Asset>());
      expect(book.isbn, equals(isbn));
      expect(book.price, equals(price));
      expect(book.color, equals(color));
      expect(book.name, equals(name));
      expect(book.weight, equals(weight));
    });

    test('Computer 생성 성공', () {
      // given
      String makerName = 'Apple';
      int price = 2000000;
      String color = '실버';
      String name = 'MacBook Pro';
      double weight = 2500.0;
      DateTime purchaseDate = DateTime(2022, 8, 15);
      double salvageValue = 500000;
      String createdDate = '2022-08-01';
      String manageDepart = 'IT 관리팀';
      String description = '맥북 프로 노트북';

      // when
      Computer computer = Computer(
        makerName: makerName,
        price: price,
        color: color,
        name: name,
        weight: weight,
        purchaseDate: purchaseDate,
        salvageValue: salvageValue,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      // then
      expect(computer, isA<Computer>());
      expect(computer, isA<TangibleAsset>());
      expect(computer, isA<Asset>());
      expect(computer.makerName, equals(makerName));
      expect(computer.price, equals(price));
      expect(computer.color, equals(color));
      expect(computer.name, equals(name));
      expect(computer.weight, equals(weight));
    });
  });
}
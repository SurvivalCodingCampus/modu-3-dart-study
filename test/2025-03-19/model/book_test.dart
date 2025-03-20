import 'package:modu_3_dart_study/2025-03-19/index.dart';
import 'package:test/test.dart';

void main() {
  group('Book Test', () {
    late Book book;

    const String isbn = '가힣';
    const double weight = 0.0;
    const int price = 100;
    const String color = 'red';
    final DateTime purchaseDate = DateTime(2025, 2);
    const String name = 'test';
    final DateTime createdDate = DateTime(2025, 1);
    const String manageDepart = '관리부';
    const String description = '설명입니다.';

    setUp(() {
      book = Book(
        isbn: isbn,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );
    });

    test('인스턴스 생성 시 값이 제대로 들어가야 한다.', () {
      expect(isbn, equals(book.isbn));
      expect(weight, equals(book.weight));
      expect(price, equals(book.price));
      expect(color, equals(book.color));
      expect(purchaseDate, equals(book.purchaseDate));
      expect(name, equals(book.name));
      expect(createdDate, equals(book.createdDate));
      expect(manageDepart, equals(book.manageDepart));
      expect(description, equals(book.description));
    });

    test('상속, 구현 단계가 올바라야 한다.', () {
      expect(book, isA<Book>());
      expect(book, isA<Thing>());
      expect(book, isA<TangibleAsset>());
      expect(book, isA<Asset>());
    });

    test('weight 값이 제대로 바뀌어야 한다', () {
      const newWeight = 150.0;
      book.weight = newWeight;

      expect(newWeight, book.weight);
    });

    test('세금 계산이 제대로 되어야 한다.', () {
      final tax = book.calculateTax();
      expect(
        tax,
        (book.price * TangibleAsset.taxRate).toInt() +
            (book.price * Book.taxRate).toInt(),
      );
    });

    test('감가상각비 계산이 정확해야 한다.', () {
      final depreAndAmort = book.depreAndAmort();

      expect(depreAndAmort, price * 0.8);
    });
  });
}

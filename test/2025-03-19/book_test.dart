import 'package:test/test.dart';

import '../../assignments/2025-03-19/book.dart';

void main() {
  const String bookName = 'iscream';
  const int bookPrice = 13500;
  const String bookColor = 'sky blue';
  const double bookWeight = 350;
  const String bookIsbn = '9788954622615';

  group('책 : ', () {
    test('완벽 생성', () {
      // given
      Book book = Book(
        name: bookName,
        price: bookPrice,
        color: bookColor,
        weight: bookWeight,
        isbn: bookIsbn,
      );

      // then
      expect(book, isA<Book>());
      expect(book.name, equals(bookName));
      expect(book.price, equals(bookPrice));
      expect(book.color, equals(bookColor));
      expect(book.weight, equals(bookWeight));
      expect(book.isbn, equals(bookIsbn));
    });

    test('무게 조절', () {
      // given
      const double bookTestWeight = bookWeight - 10;
      Book book = Book(
        name: bookName,
        price: bookPrice,
        color: bookColor,
        weight: bookWeight,
        isbn: bookIsbn,
      );

      // when
      book.weight = bookTestWeight;

      // then
      expect(book, isA<Book>());
      expect(book.name, equals(bookName));
      expect(book.price, equals(bookPrice));
      expect(book.color, equals(bookColor));
      expect(book.weight, equals(bookTestWeight));
      expect(book.isbn, equals(bookIsbn));
    });
  });
}

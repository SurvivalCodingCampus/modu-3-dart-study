import 'package:test/test.dart';

import '../../../../assignments/2025-03-19/src/solution/asset.dart';
import '../../../../assignments/2025-03-19/src/solution/book.dart';
import '../../../../assignments/2025-03-19/src/solution/tangible_asset.dart';

void main() {
  String isbn = '12345678';
  int price = 10000;
  String color = '빨강';
  String name = '어린왕자';
  double weight = 200.0;

  // given
  Book book = Book(
    isbn: isbn,
    price: price,
    color: color,
    name: name,
    weight: weight,
  );
  test('Book 생성 성공', () {
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

  test('Thing 인터페이스 getter & setter 확인', () {
    expect(book.weight, weight);
    book.weight = weight + 50;
    expect(book.weight, equals(weight + 50));
  });
}

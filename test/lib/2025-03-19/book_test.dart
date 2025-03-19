import 'package:modu_3_dart_study/2025-03-19/book.dart';
import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';
import 'package:test/test.dart';

void main() {
  test('Book은 TangibleAsset의 Sub 클래스여야한다.', () {
    // Given
    final Book book;

    // When
    book = Book(name: 'Book', color: 'Black', isbn: '123123', price: 1000);

    // Then
    expect(book, isA<TangibleAsset>());
  });
  test('Book은 이름과 색상, 컬러, 무게, isbn을 가져야한다.', () {
    // Given
    final Book book;

    // When
    book = Book(name: 'Book', color: 'Black', isbn: '123123', price: 1000);

    // Then
    expect(book.name, isNot(null));
    expect(book.price, isNot(null));
    expect(book.color, isNot(null));
    expect(book.weight, isNot(null));
    expect(book.isbn, isNot(null));
  });
  test('Book의 가격을 음수로 초기화할 경우 0으로 초기화 되어야한다.', () {
    // Given
    final Book book;

    // When
    book = Book(name: 'Book', color: 'Black', isbn: '123123', price: -1);

    // Then
    expect(book.price, equals(0));
  });

  test('Book은 무게를 세터로 지정할 수 있어야한다.', () {
    // Given
    final Book book;

    // When
    book = Book(name: 'Book', color: 'Black', isbn: '123123', price: 1000);
    book.weight = 1.0;

    // Then
    expect(book.weight, equals(1.0));
  });
  test('Book의 무게를 음수로 초기화할 경우 0.0으로 초기화 되어야한다.', () {
    // Given
    final Book book;

    // When
    book = Book(name: 'Book', color: 'Black', isbn: '123123', price: 1000);
    book.weight = -0.1;

    // Then
    expect(book.weight, equals(0.0));
  });
}

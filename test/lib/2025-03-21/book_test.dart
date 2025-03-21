import 'package:modu_3_dart_study/2025-03-21/book.dart';
import 'package:test/test.dart';

void main() {
  test('제목과 출간일이 같으면 같은 책으로 판단해야한다.', () {
    // Given
    final Book bookA;
    final Book bookB;
    final DateTime published = DateTime.parse('2025-03-21 17:00:00');

    // When
    bookA = Book(title: 'A', comment: 'Comment', publishDate: published);
    bookB = Book(title: 'A', comment: 'Different', publishDate: published);

    // Then
    expect(bookA, equals(bookB));
  });
  test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하면 출간일이 신상 순서대로 정렬되어야한다.', () {
    // Given
    final DateTime before = DateTime.parse('2025-03-21 17:00:00');
    final DateTime after = DateTime.parse('2025-03-21 18:00:00');

    final Book oldBook = Book(title: 'A', comment: 'A', publishDate: before);
    final Book newBook = Book(title: 'B', comment: 'B', publishDate: after);

    List<Book> books = [newBook, oldBook];

    // When
    books.sort();

    // Then
    expect(books, [oldBook, newBook]);
  });
  test(
    'Book의 copyWith() 메서드는 새로운 인스턴스를 반환하고, 동일한 속성을 가져야하지만 불변 객체이므로 참조값은 달라야한다.',
    () {
      // Given
      final Book bookA = Book(
        title: 'A',
        comment: 'A',
        publishDate: DateTime.now(),
      );

      // When
      Book bookB = bookA.copyWith();

      // Then
      expect(bookA, isNot(same(bookB)));
      expect(bookA.title, equals(bookB.title));
      expect(bookA.comment, equals(bookB.comment));
      expect(bookA.publishDate, equals(bookB.publishDate));
    },
  );
}

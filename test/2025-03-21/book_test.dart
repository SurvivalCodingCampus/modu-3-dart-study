import '../../assignment/2025-03-21/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book 테스트', () {
    test('제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다', () {
      const title = 'Dart Basic';
      final dateTime = DateTime(2024, 1, 1);

      final bookA = Book(title: title, command: "A", publishDate: dateTime);
      final bookB = Book(title: title, command: "B", publishDate: dateTime);

      expect(bookA == bookB, isTrue);
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.', () {
      final bookA = Book(
        title: 'Dart Basic',
        command: "A",
        publishDate: DateTime(2024, 1, 1),
      );
      final bookB = Book(
        title: 'Hello',
        command: "B",
        publishDate: DateTime(2024, 1, 2),
      );
      final bookC = Book(
        title: 'World',
        command: "C",
        publishDate: DateTime(2024, 1, 3),
      );
      final List<Book> books = [bookA, bookB, bookC];

      books.sort((a, b) => b.publishDate.compareTo(a.publishDate));

      expect(books, [bookC, bookB, bookA]);
    });

    test('copyWith() 메서드를 제공한다', () {
      final bookA = Book(
        title: 'Dart Basic',
        command: "A",
        publishDate: DateTime(2024, 1, 1),
      );

      final bookB = bookA.copyWith();

      expect(identical(bookA, bookB), isFalse);
    });
  });
}

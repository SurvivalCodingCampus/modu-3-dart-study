import 'package:test/test.dart';

import '../../assignments/2025-03-21/book.dart';

void main() {
  const String bookTitle = 'Iscream';
  const String bookComment = 'very Fun';
  final DateTime testDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime testDateLatest = DateTime(
    DateTime.now().year,
    DateTime.now().month + 1,
    DateTime.now().day + 1,
  );
  group("책책책 책을 읽읍시다 : ", () {
    test('완벽 생성', () {
      // given
      Book book = Book(
        title: bookTitle,
        publishDate: DateTime.now(),
        comment: bookComment,
      );

      // then
      expect(book, isA<Book>());
      expect(book.title, equals(bookTitle));
      expect(book.publishDate == testDate, equals(true));
      expect(book.comment, equals(bookComment));
    });
    test('책 생성 발매일 제외', () {
      // given
      Book book = Book(title: bookTitle, comment: bookComment);

      // then
      expect(book, isA<Book>());
      expect(book.title, equals(bookTitle));
      expect(book.publishDate == testDate, equals(true));
      expect(book.comment, equals(bookComment));
    });
    test('책 리스트 정렬', () {
      // given
      Book book = Book(
        title: bookTitle,
        publishDate: DateTime.now(),
        comment: bookComment,
      );

      Book book2 = Book(
        title: bookTitle,
        publishDate: testDateLatest,
        comment: bookComment,
      );

      final List<Book> bookList = [book, book2];

      // when
      bookList.sort((a, b) => a.publishDate.compareTo(b.publishDate));

      // then
      expect(bookList[0], equals(book));
      expect(bookList[1], equals(book2));
    });

    test('책 리스트 역정렬', () {
      // given
      Book book = Book(
        title: bookTitle,
        publishDate: DateTime.now(),
        comment: bookComment,
      );

      Book book2 = Book(
        title: bookTitle,
        publishDate: testDateLatest,
        comment: bookComment,
      );

      final List<Book> bookList = [book, book2];

      // when
      bookList.sort((a, b) => -a.publishDate.compareTo(b.publishDate));

      // then
      expect(bookList[0], equals(book2));
      expect(bookList[1], equals(book));
    });

    test('책 복사 위잉', () {
      // given
      Book book = Book(
        title: bookTitle,
        publishDate: DateTime.now(),
        comment: bookComment,
      );

      // when
      Book book2 = book.copyWith();

      // then
      // publishDate 가 false 인 이유 :
      // getter 를 이용해서 새로운 DateTime 을 반환하기 때문에 false 가 나온다.
      expect(identical(book, book2), equals(false));
      expect(identical(book.title, book2.title), equals(true));
      expect(identical(book.publishDate, book2.publishDate), equals(false));
      expect(identical(book.comment, book2.comment), equals(true));
    });
  });
}

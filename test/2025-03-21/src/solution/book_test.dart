import 'package:modu_3_dart_study/assignments/2025-03-21/src/solution/book.dart';
import 'package:test/test.dart';

void main() {
  final String title = '아몬드';
  final String comment = '아몬드 바삭바삭';
  final DateTime publishDate = DateTime(2025, 3, 21);

  group('Book 테스트', () {
    // given
    Book book = Book(title: title, publishDate: publishDate, comment: comment);
    test('생성 성공', () {
      // then
      expect(book, isA<Book>());
      expect(book.title, equals(title));
      expect(book.comment, equals(comment));
      expect(book.publishDate, equals(publishDate));
    });

    test('title & publishDate 값이 같으면 두 인스턴스는 동등', () {
      // given
      Book book2 = Book(
        title: title,
        publishDate: publishDate,
        comment: comment,
      );

      // then
      expect(book2, isA<Book>());
      expect(
        book,
        equals(book2),
      ); // title과 publishDate가 일치하기 때문에 book과 book2는 동일하다
    });

    test('title이 다르고 publishDate만 같으면 두 인스턴스는 비등', () {
      String testTitle = '어린왕자'; // 실패를 확인하기 위한 임시 타이틀
      // given
      Book book2 = Book(
        title: testTitle,
        publishDate: publishDate,
        comment: comment,
      );

      // then
      expect(book2, isA<Book>());
      expect(
        book,
        equals(book2),
      ); // title과 publishDate가 일치하기 때문에 book과 book2는 동일하다
    });

    test('title이 같고 publishDate이 다르면 두 인스턴스는 비등', () {
      DateTime testPublishDate = DateTime(2025, 3, 20); // 실패를 확인하기 위한 임시 출간일
      // given
      Book book2 = Book(
        title: title,
        publishDate: testPublishDate,
        comment: comment,
      );

      // then
      expect(book2, isA<Book>());
      expect(
        book,
        equals(book2),
      ); // title과 publishDate가 일치하기 때문에 book과 book2는 동일하다
    });

    test('최신 출간일 기준 내림차순 확인', () {
      DateTime testPublishDate = DateTime(2025, 3, 22); // 실패를 확인하기 위한 임시 출간일
      // given
      Book book2 = Book(
        title: title,
        publishDate: testPublishDate,
        comment: comment,
      );
      List<Book> books = [book, book2];

      // when
      books.sort();

      // then
      // 출간일이 book보다 book2이 최신이여서 [book2, book]로 정렬된다
      expect(books[0], equals(book2));
      expect(books[1], equals(book));
    });
  });
}

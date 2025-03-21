import 'package:modu_3_dart_study/2025-03-21/book.dart';
import 'package:test/test.dart';

void main() {
  // 최신 한국어 Dart 관련 책들로 예시값 변경
  final book1 = Book(
    title: 'Dart Programming',
    comment: 'Dart 언어 기초와 실습',
    publishDate: DateTime(2022, 7, 10),
  );

  final book2 = Book(
    title: 'Dart & Flutter 개발 실전',
    comment: 'Dart와 Flutter를 활용한 개발 실습서',
    publishDate: DateTime(2023, 3, 5),
  );

  final book3 = Book(
    title: 'Flutter & Dart로 배우는 모바일 앱 개발',
    comment: 'Flutter와 Dart로 앱 개발을 배우는 책',
    publishDate: DateTime(2021, 8, 15),
  );

  final book4 = Book(
    title: 'Dart Programming',
    comment: 'Dart 언어 기초와 실습 (재발간)',
    publishDate: DateTime(2022, 7, 10),
  );

  // Group()으로 테스트 그룹화
  group('Book 클래스 테스트', () {
    test('같은 제목과 출간일을 가진 책들은 동일한 책으로 판단', () {
      // `book1`과 `book4`는 동일한 제목과 출간일을 가짐
      expect(book1 == book4, true);
      expect(book1.hashCode, equals(book4.hashCode));
    });

    test('제목이나 출간일이 다른 책들은 동일하지 않음', () {
      // `book1`과 `book2`는 제목과 출간일이 다름
      expect(book1 == book2, false);
    });

    test('출간일 기준으로 책들을 내림차순(최신순)으로 정렬', () {
      List<Book> books = [book1, book2, book3];

      // 정렬 실행
      books.sort();

      // 최신 출간일로 정렬되었는지 확인
      expect(books[0].publishDate, equals(book2.publishDate)); // 2023-03-05
      expect(books[1].publishDate, equals(book1.publishDate)); // 2022-07-10
      expect(books[2].publishDate, equals(book3.publishDate)); // 2021-08-15
    });

    test('copyWith() 메서드가 제대로 동작하는지 확인 ', () {
      final strSoldOut = '매진';
      Book modifiedBook = book1.copyWith(comment: strSoldOut);

      expect(modifiedBook == book1, true); // 코멘트는 동등 함수에서 정의하지 않았기 떄문에 true
      expect(modifiedBook.comment, strSoldOut);
      expect(modifiedBook.title, book1.title);
      expect(modifiedBook.publishDate, book1.publishDate);
    });
  });
}

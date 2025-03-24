import 'package:modu_3_dart_study/PR2025-03-21/bookSort.dart';
import 'package:test/test.dart';

void main() {
  String title = '어린왕자';
  String comment = '최고의책';
  DateTime publishDate = DateTime(2000, 01, 11);
  Book book1 = Book(title: title, comment: comment, publishDate: publishDate);

  group('book1 생성 Test', () {
    test('book1 생성 Test', () {
      expect(book1.title, equals(title));
      expect(book1.comment, equals(comment));
      expect(book1.publishDate, equals(publishDate));
    });
  });
  //comment는 따지지 않고 title과 publishDate가 같다면 동일한 책
  group('book1과 동일한 book2 생성후 동등성 확인 Test', () {
    test('book1과 동일한 book2 생성후 동등성 확인 Test', () {
      final book2 = Book(
        title: '어린왕자',
        comment: '감명깊은 책',
        publishDate: DateTime(2000, 01, 11),
      );
      expect(book2, equals(book1));
    });
  });

  group('정렬기능 확인 Test', () {
    test('내림차순 정렬 확인', () {
      final book2 = Book(
        title: '인어공주',
        comment: '고전작',
        publishDate: DateTime(2020, 01, 18),
      );
      final books = [book1, book2];
      final byPublishDate =
          books.toList()
            ..sort((a, b) => -a.publishDate.compareTo(b.publishDate));
      expect(byPublishDate.first, equals(book2));
    });
    test('오름차순 정렬 확인', () {
      final book2 = Book(
        title: '인어공주',
        comment: '고전작',
        publishDate: DateTime(2020, 01, 18),
      );
      final books = [book1, book2];
      final byPublishDate =
          books.toList()
            ..sort((a, b) => a.publishDate.compareTo(b.publishDate));
      expect(byPublishDate.first, equals(book1));
    });
  });

  group('copyWith 확인 Test', () {
    test('copyWith을 통해 아무런 필드가 없으면 기존값 그대로 받아오기', () {
      final book2 = book1.copyWith();

      expect(book2.title, equals(title));
      expect(book2.comment, equals(comment));
      expect(book2.publishDate, equals(publishDate));
    });
    test('copyWith을 통해 필드값 존재하면 값 바꾸기', () {
      final book2 = book1.copyWith(publishDate: DateTime(2025, 03, 21));

      expect(book2.title, equals(title));
      expect(book2.comment, equals(comment));
      expect(book2.publishDate, equals(DateTime(2025, 03, 21)));
    });
  });
  //comment는
}

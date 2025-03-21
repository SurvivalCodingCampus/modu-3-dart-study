import 'dart:io';
import 'dart:math';

import 'package:modu_3_dart_study/2025-03-21/book.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  group('Book 생성 및 복사 테스트', () {
    test('Book 생성 테스트', () {
      final Book defaultBook = Book(title: '1권', comment: '기본 책');
      final DateTime now = DateTime.now();

      expect(defaultBook.title, equals('1권'));
      expect(defaultBook.comment, equals('기본 책'));
      expect(defaultBook.publishDate.year, equals(now.year));
      expect(defaultBook.publishDate.month, equals(now.month));
      expect(defaultBook.publishDate.day, equals(now.day));
    });
    test('Book 복사 테스트', () {
      final Book defaultBook = Book(title: '1권', comment: '기본 책');
      final Book copyBook = defaultBook.copyWith();

      expect(defaultBook.title, equals(copyBook.title));
      expect(defaultBook.comment, equals(copyBook.comment));
      expect(defaultBook.publishDate.year, equals(copyBook.publishDate.year));
      expect(defaultBook.publishDate.month, equals(copyBook.publishDate.month));
      expect(defaultBook.publishDate.day, equals(copyBook.publishDate.day));
      expect(defaultBook == copyBook, isTrue);
    });
  });

  group('==(Equal) 테스트', () {
    test('출간일만 같은 경우엔 같지 않다.', () {
      final Book defaultBook = Book(title: '1권', comment: '기본 책');
      final Book copyBook = defaultBook.copyWith(title: '2권');

      expect(defaultBook == copyBook, isFalse);
    });
    test('제목만 같은 경우엔 같지 않다.', () {
      final Book defaultBook = Book(title: '1권', comment: '기본 책');
      final DateTime dateTime = DateTime(2023); // 2023-01-01 00:00:00.000
      final Book copyBook = defaultBook.copyWith(publishDate: dateTime);

      expect(defaultBook == copyBook, isFalse);
    });
    test('제목과 출간일(연, 월, 일)이 같은 경우에는 같은 책으로 판단한다.', () {
      final DateTime defaultDateTime = DateTime(
        2024,
        1,
        1,
        12,
      ); // 2024-01-01 12:00:00.000
      final DateTime otherDateTime = DateTime(
        2024,
        1,
        1,
        1,
      ); // 2023-01-01 00:00:00.000
      final Book defaultBook = Book(
        title: '1권',
        comment: '기본 책',
        publishDate: defaultDateTime,
      );
      final Book copyBook = defaultBook.copyWith(publishDate: otherDateTime);

      expect(defaultBook == copyBook, isTrue);
    });
  });

  group('Sort 테스트', () {
    // 1권이 빠른 일자에 나온 것

    final Book defaultBook = Book(
      title: '1권',
      comment: '기본 책',
      publishDate: DateTime(2025, 1, 1),
    );
    final DateTime dateTime1 = DateTime(2025, 6, 1);
    final DateTime dateTime2 = DateTime(2026, 1, 1);

    test('calculate', () {
      List<Book> bookList = [];

      bookList.add(defaultBook.copyWith(title: '2권', publishDate: dateTime1));
      bookList.add(defaultBook.copyWith(title: '3권', publishDate: dateTime2));
      bookList.add(defaultBook);

      // 신상(가장 나중에 나온 날짜) 순으로 정렬
      bookList.sort(
        (Book a, Book b) => -a.publishDate.compareTo(b.publishDate),
      );

      for (int i = 0; i < bookList.length - 1; i++) {
        expect(
          bookList[i].publishDate.compareTo(bookList[i + 1].publishDate),
          greaterThanOrEqualTo(0),
        );
      }
    });
  });
}

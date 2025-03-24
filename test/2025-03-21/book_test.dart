import 'package:test/test.dart';

import '../../assignments/2025-03-21/book.dart';

void main() {
  group('book test', () {
    final books = [
      Book(title: "운수좋은날", comment: "재밌음"),
      Book(title: "홍길동전", comment: "재밌음", publishDate: DateTime(2020)),
      Book(title: "운수좋은날", comment: "재밌음", publishDate: DateTime(2023)),
      Book(title: "운수좋은날", comment: "재밌음"),
      Book(title: "운수좋은날", comment: "재밌음", publishDate: DateTime(2025, 3, 20)),
      Book(title: "운수좋은날", comment: "재밌음", publishDate: DateTime(2025, 3, 22)),
      Book(title: "가시고기", comment: "재밌음", publishDate: DateTime(2021)),
    ];

    test('book == 함수 테스트', () {
      expect(books[0] == books[3], true);
      expect(books[0] == books[4], false);
      expect(books[0] == books[5], false);
    });

    test('book hashcode 함수 테스트', () {
      final bookSet = {
        Book(title: 'title', comment: 'comment', publishDate: DateTime(2000,1,1)),
        Book(title: 'title', comment: 'comment', publishDate: DateTime(2000,1,1,3,5)),
        Book(title: 'title', comment: 'comment', publishDate: DateTime(2000,1,2)),
      };
      expect(bookSet.length, 2);
    });

    test('book sort 함수 테스트', () {
      print("-- sort before --");
      for (final book in books) {
        print(book.toString());
      }
      books.sort();
      print("-- sort after --");
      for (final book in books) {
        print(book.toString());
      }
    });

    test('book copywith 함수 테스트', () {
      final bookTitle = "책책책";
      final bookComment = "내용내용내용";
      final book1 = books[0].copywith(title: bookTitle, comment: bookComment);

      expect(book1.title, bookTitle);
      expect(book1.comment, bookComment);
      expect(book1.publishDate, books[0].publishDate);
    });
  });
}

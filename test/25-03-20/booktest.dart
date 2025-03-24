import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-21/Bookclass.dart';

void main() {
  group('BookTest', () {
    test('publishDate와 title이 같으면 같은 책', () {
      final book1 = Book(
        title: '죄와벌',
        comment: 'Comment 1',
        publishDate: DateTime(2002, 12, 1),
      );
      final book2 = Book(
        title: '죄와벌',
        comment: 'Comment 2',
        publishDate: DateTime(2002, 12, 1),
      );
      expect(book1, equals(book2));
    });
    test('publishDate와 title이 다르면 다른 책', () {
      final book1 = Book(
        title: '죄와벌',
        comment: 'Comment 1',
        publishDate: DateTime(2002, 12, 1),
      );
      final book2 = Book(
        title: '채식주의자',
        comment: 'Comment 2',
        publishDate: DateTime(2022, 4, 1),
      );
      expect(book1, isNot(equals(book2)));
    });
  });
}

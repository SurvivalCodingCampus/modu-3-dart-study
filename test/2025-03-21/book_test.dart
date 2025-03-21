import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-21/book.dart';

void main() {
  final String title = "Flutter";
  final String testTitle = "ModuFlutter";

  final DateTime publishDate = DateTime(2024,01,01);
  final DateTime testPublishDate = DateTime(2024,01,02);

  final String comment = "Flutter is awesome!";
  final String testComment = "Flutter is Not awesome!";

  group("Book 클래스",(){
    test("Book 생성", (){
      Book book = Book(title: title, comment: comment, publishDate: publishDate);

      expect(book.title, equals(title));
      expect(book.publishDate, equals(publishDate));
      expect(book.comment, equals(comment));
    });


    test("제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다. ", (){
      Book book1 = Book(title: title, comment: comment, publishDate: publishDate);
      Book book2 = Book(title: title, comment: testComment, publishDate: publishDate);
      Book book3 = Book(title: testTitle, comment: testComment, publishDate: testPublishDate);
      Book book4 = Book(title: title, comment: testComment, publishDate: testPublishDate);

      expect(book1 == book2, equals(true));
      expect(book2 == book3, equals(false));

      expect(book1 == book3, equals(false));
      expect(book3 == book4, equals(false));
    });

    test("Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.", (){
      List<Book> list = [];
      for(int i=1; i<11; i++) {
        Book book = Book(title: title, comment: comment, publishDate: DateTime(2024,1,i));
        list.add(book);
      }

      //역순 정렬
      list.sort((a,b) => a.publishDate.compareTo(b.publishDate) * -1);

      for(int i=0; i<10; i++) {
        expect(list[i].publishDate, equals(DateTime(2024,1,10-i)));
        print(list[i].toString());
      }
    });


    test("copyWith() 메서드 제공", (){
      Book book = Book(title: title, comment: comment, publishDate: publishDate);

      Book book2 = book.copyWith();

      expect(book.title, equals(book2.title));
      expect(book.comment, equals(book2.comment));
      expect(book.publishDate, equals(book2.publishDate));
    });
  });
}
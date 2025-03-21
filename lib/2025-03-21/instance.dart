

import 'package:modu_3_dart_study/2025-03-18/inheritance.dart';

void main(List<String> args) {
  final herosList = <Hero>[];
  final herosSet = <Hero>{};

  final h1 = Hero('h1', 30);
  final h2 = Hero('h2', 30);

  herosList.add(h1);
  print(herosList.length);

  herosList.remove(h2);
  print(herosList.length);

  herosSet.add(h1);
  print(herosSet.length);

  herosSet.remove(h2);
  print(herosSet.length);

  // DateTime date = DateTime.now();

  final Book book1 = Book(
    title: 'book1',
    comment: 'comment1',
    publishDate: DateTime(2025, 3, 1),
  );
  final Book book2 = Book(
    title: 'book2',
    comment: 'comment2',
    publishDate: DateTime(2025, 3, 2),
  );
  final Book book3 = Book(
    title: 'book3',
    comment: 'comment3',
    publishDate: DateTime(2025, 3, 3),
  );

  List<Book> bookList = [book1, book2, book3];
  print(bookList..sort());
}

class Book implements Comparable {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Book &&
            title == other.title &&
            publishDate == other.publishDate);
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(other) {
    return other.publishDate.compareTo(publishDate);
  }

  @override
  String toString() {
    return 'Book title : $title, publishDate : $publishDate';
  }
}

// 오늘 과제한게 어제 풀리퀘스트로 들어가버려서 주석만 추가
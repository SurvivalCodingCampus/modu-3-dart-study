import 'Book.dart';

void main() {
  //1. 제목과 출간일이 같으면 같은 책으로 판단한다
  Book book1 = Book(title: "듀얼 브레인", comment: "⟨뉴욕 타임스⟩ 베스트셀러");
  Book book2 = Book(
    title: "듀얼 브레인",
    comment: "⟨뉴욕 타임스⟩ 베스트셀러",
    publishDate: DateTime.parse("2025-03-21 13:00"),
  );
  Book book3 = Book(
    title: "듀얼 브레인",
    comment: "⟨뉴욕 타임스⟩ 베스트셀러",
    publishDate: DateTime.now(),
  );

  print(book1 == book2);
  print(book1 == book3);

  //2. Book 인스턴스를 담고 있는 컬렉션에 대해 sort()를 수행하여 출간일이 신상 순서대로 정렬한다.
  //3. copyWith() 메서드를 제공한다
  Book newBook = Book(
    title: "듀얼 브레인",
    comment: "⟨뉴욕 타임스⟩ 베스트셀러",
    publishDate: DateTime.parse("2025-03-20"),
  );

  List<Book> bookList = [
    newBook.copyWith(publishDate: DateTime.parse("2025-02-11")),
    newBook.copyWith(publishDate: DateTime.parse("2025-03-19")),
    newBook.copyWith(publishDate: DateTime.parse("2025-01-17")),
  ];

  bookList.sort((a, b) => a.publishDate.compareTo(b.publishDate) * -1);

  print(bookList);
}

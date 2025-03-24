import 'book.dart';

void main() {
  Book book1 = Book(title: '개발', comment: '인스턴스');
  Book book2 = Book(title: '개발', comment: '추상클래스');

  // true 출력 완료
  print(book1 == book2);

  List bookList = <Book>[];

  bookList.add(book1);
  bookList.add(book2);

  print(bookList);
}

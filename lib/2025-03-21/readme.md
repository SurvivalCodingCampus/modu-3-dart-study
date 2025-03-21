

다음과 같은 Book 클래스가 있다.



```dart
class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();
}
```
다음 동작을 할 수 있도록 Book 클래스를 수정하시오.

1. 제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다
2. Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.
3. copyWith() 메서드를 제공한다
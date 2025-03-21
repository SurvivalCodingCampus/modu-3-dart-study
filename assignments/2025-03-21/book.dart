class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title, 
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other )=>
  identical(this, other) ||
  other is Book &&
  runtimeType == other.runtimeType &&
  publishDate == other.publishDate &&
  title == other.title;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate);
  }

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }
}
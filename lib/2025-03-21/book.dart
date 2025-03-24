class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
      : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Book &&
              runtimeType == other.runtimeType &&
              // 제목, 연, 월, 일이 같으면 같은 책으로 판단.
              title == other.title &&
              publishDate.year == other.publishDate.year &&
              publishDate.day == other.publishDate.day &&
              publishDate.month == other.publishDate.month;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate}';
  }

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(title: title ?? this.title,
        comment: comment ?? this.comment,
        publishDate: publishDate ?? this.publishDate);
  }
}
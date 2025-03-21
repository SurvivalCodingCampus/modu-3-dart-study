class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  String toString() {
    // TODO: implement toString
    return 'Book{title : ${this.title}, comment : ${this.comment}, '
        'publishDate : ${this.publishDate}}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          this.title == other.title &&
          this.publishDate.year == other.publishDate.year &&
          this.publishDate.month == other.publishDate.month &&
          this.publishDate.day == other.publishDate.day;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode ^ comment.hashCode;

  //얕은 복사
  Book copyWith({String? title, String? comment, DateTime? publishDate}) =>
      Book(
        title: title ?? this.title,
        comment: comment ?? this.comment,
        publishDate: publishDate ?? this.publishDate,
      );
}

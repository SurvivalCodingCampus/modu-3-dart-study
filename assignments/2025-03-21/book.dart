class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Book &&
      runtimeType == other.runtimeType &&
      publishDate == other.publishDate &&
        title == other.title;


  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment
  }){
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment
    );
  }

  @override
  String toString() {
    return("title: $title, comment: $comment, publishDate: $publishDate");
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

}
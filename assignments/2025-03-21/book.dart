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
            publishDate.year == other.publishDate.year &&
            publishDate.month == other.publishDate.month &&
            publishDate.day == other.publishDate.day);
  }

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode;

  @override
  int compareTo(other) {
    return other.publishDate.compareTo(publishDate);
  }

  @override
  String toString() {
    return 'Book title : $title';
  }
}

// 오늘 과제한게 어제 풀리퀘스트로 들어가버려서 주석만 추가

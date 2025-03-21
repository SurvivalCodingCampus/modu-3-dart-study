class Book implements Comparable<Book>{
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  // 동등성 비교 규칙 재정의
  @override
  bool operator ==(Object other) {
    // 얕거나 해시코드 동일하면 그냥 같게
    if (identical(this, other)) return true;

    return other is Book &&
        other.title == title &&
        other.publishDate == publishDate;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // Comparable 오버라이드하여 출간일을 최신 기준으로 정렬
  @override
  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate);  // 내림차순으로 비교
  }

  // 복사
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }

}

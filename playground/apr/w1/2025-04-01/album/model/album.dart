class Album {
  final int userId;
  final int id;
  final String title;

  const Album(this.userId, this.id, this.title);

  Album copyWith({int? userId, int? id, String? title}) {
    return Album(userId ?? this.userId, id ?? this.id, title ?? this.title);
  }

  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Album &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
}

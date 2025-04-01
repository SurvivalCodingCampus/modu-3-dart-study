class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  Album copyWith({int? userId, int? id, String? title}) {
    if ((userId == null || identical(userId, this.userId)) &&
        (id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title))) {
      return this;
    }

    return Album(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {'userId': this.userId, 'id': this.id, 'title': this.title};
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
    );
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
}

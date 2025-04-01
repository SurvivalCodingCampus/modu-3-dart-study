class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  Album copyWith({int? userId, int? id, String? title}) {
    return Album(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return 'Album(userId: $userId, id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Album &&
            other.userId == userId &&
            other.id == id &&
            other.title == title);
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }
}

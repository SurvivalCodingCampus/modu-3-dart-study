class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  @override
  String toString() {
    return '{userId: $userId, id: $id, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Album &&
            userId == other.userId &&
            id == other.id &&
            title == other.title;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;
}

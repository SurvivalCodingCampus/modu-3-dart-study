class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);

  Album copyWith({int? userId, int? id, String? title}) {
    return Album(userId ?? this.userId, id ?? this.id, title ?? this.title);
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

  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}';
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json['userId'], json['id'], json['title']);
  }
  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
}

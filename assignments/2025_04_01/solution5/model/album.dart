class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Album &&
        userId == other.userId &&
        id == other.id &&
        title == other.title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'Album(userId : $userId, id : $id, title : $title)\n';
  }

  Album copyWith() {
    return Album(userId: userId, id: id, title: title);
  }
}

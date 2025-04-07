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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Album &&
        other.userId == userId &&
        other.id == id &&
        other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'title': title});

    return result;
  }

  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  @override
  String toString() => 'Album(userId: $userId, id: $id, title: $title)';
}

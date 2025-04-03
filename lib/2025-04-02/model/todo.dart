class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  final DateTime createdAt;

  Todo(this.userId, this.id, this.title, this.completed, this.createdAt);

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
  }) {
    return Todo(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
      createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo &&
              runtimeType == other.runtimeType &&
              userId == other.userId &&
              id == other.id &&
              title == other.title &&
              completed == other.completed &&
              createdAt == other.createdAt;

  @override
  int get hashCode =>
      userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      completed.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Todo(userId: $userId, id: $id, title: $title, completed: $completed, createdAt: $createdAt)';
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['userId'],
      json['id'],
      json['title'],
      json['completed'],
      json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
        'createdAt': createdAt
      };
}

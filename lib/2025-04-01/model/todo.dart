class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todo copyWith({int? userId, int? id, String? title, bool? completed}) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, userId: $userId, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Todo &&
            other.userId == userId &&
            other.id == id &&
            other.title == title &&
            other.completed == completed);
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}

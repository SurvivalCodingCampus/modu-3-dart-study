class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  Todo copyWith({int? userId, int? id, String? title, bool? completed}) {
    return Todo(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.userId &&
          completed == other.completed;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['userId'], json['id'], json['title'], json['completed']);
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };
}

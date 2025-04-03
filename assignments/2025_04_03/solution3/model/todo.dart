class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, required this.completed});

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'completed': completed};
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        id == other.id &&
        title == other.title &&
        completed == other.completed;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'Todo( id : $id, title : $title, completed : $completed)\n';
  }

  Todo copyWith({int? id, String? title, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

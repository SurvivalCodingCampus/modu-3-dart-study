class Todo {
  final int id;
  final String title;
  final bool completed;
  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });
  

  Todo copyWith({
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }


  @override
  String toString() => 'Todo(id: $id, title: $title, completed: $completed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Todo &&
      other.id == id &&
      other.title == title &&
      other.completed == completed;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;
}

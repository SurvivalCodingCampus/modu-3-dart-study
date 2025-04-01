import 'todo_model.dart';

class TodoList {
  final List<Todo> list;

  TodoList({required this.list});

  factory TodoList.fromJson(Map<String, dynamic> json) {
    final list =
        (json['list'] as List<dynamic>).map((e) => Todo.fromJson(e)).toList();
    return TodoList(list: list);
  }
}

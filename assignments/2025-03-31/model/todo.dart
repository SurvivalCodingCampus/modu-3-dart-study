// 1번 문제
import '../data_source/todo_data_source_impl.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
    );
  }
}

// 2번 문제

// class Todo {
//   final int userId;
//   final int id;
//   final String title;
//   final bool completed;

//   Todo({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.completed,
//   });

//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       userId: json['userId'] ?? 0,
//       id: json['id'] ?? 0,
//       title: json['title'] ?? '',
//       completed: json['completed'] ?? false,
//     );
//   }

//   static List<Todo> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => Todo.fromJson(json)).toList();
//   }
// }

// 1번 main 


void main() async {
  final todoDataSource = TodoDataSourceImpl();
  final todo = await todoDataSource.getTodo();
  print('User ID: ${todo.userId}');
  print('ID: ${todo.id}');
  print('Title: ${todo.title}');
  print('Completed: ${todo.completed}');
}

// 2번 main

// void main() async {
//   final todoDataSource = TodoDataSourceImpl();

//   try {
//     final todos = await todoDataSource.getTodos();
//     for (var todo in todos) {
//       print('User ID: ${todo.userId}');
//       print('ID: ${todo.id}');
//       print('Title: ${todo.title}');
//       print('Completed: ${todo.completed}');
//       print('---');
//     }
//   } catch (e) {
//     print("에러 발생: $e");
//   }
// }
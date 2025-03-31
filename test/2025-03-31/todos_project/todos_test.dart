


import 'package:modu_3_dart_study/2025-03-31/todos_project/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/todos_project/model/todo.dart';

void main() async {
  final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/todos_project/';
  final TodoDataSourceImpl dataSource = TodoDataSourceImpl(filePath + 'todos.json');
  final List<Todo> todos = await dataSource.getTodos();

  for (Todo todo in todos) {
    print(todo);
  }
}

























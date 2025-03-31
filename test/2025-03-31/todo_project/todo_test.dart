
import 'package:modu_3_dart_study/2025-03-31/todo_project/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/todo_project/model/todo.dart';

void main() async {
  final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/todo_project/';
  final TodoDataSourceImpl dataSource = TodoDataSourceImpl(filePath + 'todo.json');
  final Todo todo = await dataSource.getTodo();
  print(todo);
}


























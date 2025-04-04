
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';
import 'package:test/test.dart';

void main() {
  final TodoDataSource dataSource = TodoDataSourceImpl();

  test('1번 문제', () async {
    final Map<String, dynamic> expected = {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    };

    final Todo todo = await dataSource.getTodo(0);

    expect(todo.toJson(), expected);
  });

  test('2번 문제', () async {
    final List<Todo> todos = await dataSource.getTodos();

  });
}
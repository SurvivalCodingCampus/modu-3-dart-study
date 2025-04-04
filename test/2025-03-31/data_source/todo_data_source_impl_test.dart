import 'package:modu_3_dart_study/2025-03-31/todo.dart';
import 'package:modu_3_dart_study/2025-03-31/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/todo_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final TodoDataSource dataSource = TodoDataSourceImpl();

  test('1번 문제', () async {
    final Map<String, dynamic> expected = {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false,
    };

    final Todo todo = await dataSource.getTodo();

    expect(todo.toJson(), expected);
  });
}

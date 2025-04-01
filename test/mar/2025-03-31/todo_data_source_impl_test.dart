import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-31/todo/data_source/todo_data_source_impl.dart';
import '../../../playground/mar/2025-03-31/todo/model/todo.dart';

void main() {
  test('todoJson', () async {
    final dataSource = TodoDataSourceImpl();
    final todo = await dataSource.getTodo();

    expect(todo.userId, equals(1));
    expect(todo.id, equals(1));
    expect(todo.title, equals('delectus aut autem'));
    expect(todo.completed, isFalse);
  });
  test('todoList', () async {
    final dataSource = TodoDataSourceImpl();
    final todoList = await dataSource.getListTodo();

    expect(todoList, isA<List<Todo>>());
    expect(todoList.length, equals(200));
  });
}

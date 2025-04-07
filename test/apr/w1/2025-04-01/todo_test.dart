import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../playground/apr/w1/2025-04-01/todo/data_source/mock_todo_data_source_impl.dart';
import '../../../../playground/apr/w1/2025-04-01/todo/repository/todo_repository_impl.dart';

void main() {
  test('todo', () async {
    final todoRepository = await TodoRepositoryImpl(MockTodoDataSourceImpl());
    final todoData = await todoRepository.getTodos();
    final todoCompletedData = await todoRepository.getCompletedTodos();

    expect(todoData.length, equals(8));
    expect(todoCompletedData.length, equals(2));
  });
}

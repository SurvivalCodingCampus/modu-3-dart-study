import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../../assignments/2025-03-31/data_source/todo/todo_list_data_source.dart';
import '../../../../assignments/2025-03-31/data_source/todo/todo_list_data_source_impl.dart';

void main() {
  test('todo list data 역직렬화 테스트', () async {
    final TodoListDataSource dataSourceImpl = TodoListDataSourceImpl();
    final todoList = await dataSourceImpl.fetchTodoList();

    expect(todoList.length, equals(200));
  });
}

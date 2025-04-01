import 'package:test/test.dart';
import '../../../../../assignments/structure/2025-03-31/data_source/todo/todo_data_source.dart';
import '../../../../../assignments/structure/2025-03-31/data_source/todo/todo_data_source_impl.dart';

void main() {
  test('todo data 역직렬화 테스트', () async {
    final TodoDataSource dataSourceImpl = TodoDataSourceImpl();
    final todo = await dataSourceImpl.fetchTodo();
    final todoList = await dataSourceImpl.fetchTodos();

    expect(todo.id, equals(1));
    expect(todo.userId, equals(1));
    expect(todo.title, equals("delectus aut autem"));
    expect(todo.completed, equals(false));

    expect(todoList.length, equals(200));
  });
}

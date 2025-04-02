import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/mock_todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/model/todo.dart';
import 'package:test/test.dart';

void main() async {
  test('1. MockData 테스트', () async {
    TodoRepository todoRepository = TodoRepositoryImpl(
      todoDataSource: MockTodoDataSourceImpl(),
    );

    List<Todo> getTodosList = await todoRepository.getTodos();
    List<Todo> getCompletedTodos = await todoRepository.getCompletedTodos();

    expect(getTodosList.length, equals(39));
    expect(getCompletedTodos.length, equals(18));
  });

  test('2. RealData 테스트', () async {
    TodoRepository todoRepository = TodoRepositoryImpl(
      todoDataSource: TodoDataSourceImpl(
        path: 'lib/2025-04-01/solution3/data_source/todos.json',
      ),
    );

    List<Todo> getTodosList = await todoRepository.getTodos();
    List<Todo> getCompletedTodos = await todoRepository.getCompletedTodos();

    expect(getTodosList.length, equals(200));
    expect(getCompletedTodos.length, equals(90));
  });
}

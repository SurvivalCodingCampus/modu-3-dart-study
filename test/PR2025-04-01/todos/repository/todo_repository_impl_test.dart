import 'package:modu_3_dart_study/PR2025-04-01/todos/model/todo.dart';
import 'package:modu_3_dart_study/PR2025-04-01/todos/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('todo.json에서 completed가 true인 객체만 출력하는 test', () async {
    TodoRepositoryImpl todoRepositoryImpl = TodoRepositoryImpl();
    final List<Todo> todos = await todoRepositoryImpl.getCompletedTodos();

    for (var item in todos) {
      expect(item.completed, true);
    }
  });
}

import 'package:test/test.dart';

import '../../assignments/2025-04-01/todo/data_source/impl/todo_data_source_impl.dart';
import '../../assignments/2025-04-01/todo/model/todo.dart';
import '../../assignments/2025-04-01/todo/repository/impl/todo_repository_impl.dart';
import '../../assignments/2025-04-01/todo/repository/todo_repository.dart';

void main() {
  final TodoRepository todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
    Todo(),
  );

  group('할일 : ', () {
    test('전체 받아오기', () async {
      print(await todoRepository.getItems('todos.json'));
    });
    test('완료된 일만 받아오기', () async {
      List<Todo> todos = await todoRepository.getItemsByCompleted('todos.json');

      expect(
        todos.where((element) => element.completed == false).toList(),
        isEmpty,
      );
    });
  });
}

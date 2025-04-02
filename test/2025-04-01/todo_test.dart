import 'package:test/test.dart';

import '../../assignments/2025-04-01/todo/model/todo.dart';
import '../../assignments/2025-04-01/todo/repository/impl/todo_repository_impl.dart';
import '../../assignments/2025-04-01/todo/repository/todo_repository.dart';
import 'mock/mock_todo_data_source.dart';

void main() {
  late MockTodoDataSource todoDataSource;
  late TodoRepository todoRepository;
  late Todo todo;

  group('할일 : ', () {
    setUpAll(() {
      todoDataSource = MockTodoDataSource();
      todo = Todo();
      todoRepository = TodoRepositoryImpl(todoDataSource, todo);

      todoDataSource.setMockData('todos.json', [
        {
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": true,
        },
        {
          "userId": 1,
          "id": 2,
          "title": "quis ut nam facilis et officia qui",
          "completed": false,
        },
        {
          "userId": 1,
          "id": 3,
          "title": "fugiat veniam minus",
          "completed": false,
        },
      ]);
    });
    test('전체 받아오기', () async {
      List<Todo> todos = await todoRepository.getItems('todos.json');

      expect(todos.length, 3);
      expect(todos.first.id, 1);
      expect(todos.first.title, 'delectus aut autem');
    });
    test('완료된 일만 받아오기', () async {
      List<Todo> todos = await todoRepository.getItemsByCompleted('todos.json');

      expect(
        todos.where((element) => element.completed == false).toList(),
        isEmpty,
      );
      expect(todos.length, 1);
    });
    test('받아오기 실패', () async {
      expect(
        () async => await todoRepository.getItems('todos2.json'),
        throwsA(isArgumentError),
      );
    });
  });
}

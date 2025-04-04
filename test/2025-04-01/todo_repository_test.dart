import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-04-01/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository_impl.dart';

class MockTodoDataSource implements TodoDataSource {
  static const List<Map<String, dynamic>> mockJsonTodos = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false,
    },
    {"userId": 1, "id": 3, "title": "fugiat veniam minus", "completed": false},
    {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
    {
      "userId": 1,
      "id": 5,
      "title":
          "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 6,
      "title": "qui ullam ratione quibusdam voluptatem quia omnis",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 7,
      "title": "illo expedita consequatur quia in",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 8,
      "title": "quo adipisci enim quam ut ab",
      "completed": true,
    },
    {
      "userId": 1,
      "id": 9,
      "title": "molestiae perspiciatis ipsa",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 10,
      "title": "illo est ratione doloremque quia maiores aut",
      "completed": true,
    },
    {
      "userId": 1,
      "id": 11,
      "title": "vero rerum temporibus dolor",
      "completed": true,
    },
    {
      "userId": 1,
      "id": 12,
      "title": "ipsa repellendus fugit nisi",
      "completed": true,
    },
    {"userId": 1, "id": 13, "title": "et doloremque nulla", "completed": false},
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchTodos(String path) async {
    return mockJsonTodos;
  }
}

void main() {
  TodoDataSource mockUserDataSource = MockTodoDataSource();
  TodoRepository todoRepository = TodoRepositoryImpl(
    todoDataSource: mockUserDataSource,
  );

  group('Todo Repository 테스트', () {
    test('getTodos() -> 정상적으로 Todos 반환해야함', () async {
      final mockTodos =
          MockTodoDataSource.mockJsonTodos
              .map((e) => Todo.fromJson(e))
              .toList();

      final todos = await todoRepository.getTodos();

      expect(ListEquality().equals(todos, mockTodos), isTrue);
    });

    test('.getCompletedTodos() -> 완료 된 todos를 반환해야 한다', () async {
      final mockTodos =
          MockTodoDataSource.mockJsonTodos
              .map((e) => Todo.fromJson(e))
              .where((e) => e.completed == true)
              .toList();

      final todos = await todoRepository.getCompletedTodos();

      expect(ListEquality().equals(todos, mockTodos), isTrue);
    });
  });
}

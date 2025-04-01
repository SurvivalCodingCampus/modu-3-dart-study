import 'package:modu_3_dart_study/2025-03/2025-03-31/data_sources/todo/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-31/data_sources/todo/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-31/models/todo.dart';
import 'package:test/test.dart';

void main() {
  final TodoDataSource dataSource = TodoDataSourceImpl();

  test('todo.json을 데이터소스 구현체를 통해 역직렬화 해야한다.', () async {
    const String path = '/lib/2025-03/2025-03-31/data/todo.json';
    Todo todo = await dataSource.getTodo(path);

    expect(todo, isA<Todo>());
    expect(todo.title, equals('delectus aut autem'));
  });

  test('todos.json을 데이터소스 구현체를 통해 역직렬화 해야한다.', () async {
    const String path = '/lib/2025-03/2025-03-31/data/todos.json';
    List<Todo> todos = await dataSource.getTodos(path);

    expect(todos, isA<List<Todo>>());
    expect(todos[1].title, equals('quis ut nam facilis et officia qui'));
  });
}

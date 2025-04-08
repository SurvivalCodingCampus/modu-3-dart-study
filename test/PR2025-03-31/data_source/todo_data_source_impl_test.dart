import 'package:modu_3_dart_study/PR2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-03-31/model/todo.dart';
import 'package:test/test.dart';

void main() {
  const userId = 1;
  const id = 1;
  const title = 'delectus aut autem';
  const completed = false;

  final Map<String, dynamic> expected = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false,
  };

  test('todo.json 확인', () async {
    final dataSource = TodoDataSourceImpl();
    final todo = await dataSource.getTodo();

    expect(todo, isA<Todo>());
    //json형태로 바뀌었는지 확인하는 테스트
    expect(todo.toJson(), expected);
    expect(todo.userId, equals(userId));
    expect(todo.id, equals(id));
    expect(todo.title, equals(title));
    expect(todo.completed, equals(completed));
  });
}

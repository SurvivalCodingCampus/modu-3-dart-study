import 'package:modu_3_dart_study/PR2025-03-31/data_source2/todo_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  const userId = 1;
  const id = 2;
  const title = 'quis ut nam facilis et officia qui';
  const completed = false;

  test('todos.json에서 2번째 리스트 확인', () async {
    final dataSource = TodosDataSourceImpl();
    final todos = await dataSource.getTodos();
    expect(todos[1].title, title);
    expect(todos[1].userId, userId);
    expect(todos[1].id, id);
  });
}

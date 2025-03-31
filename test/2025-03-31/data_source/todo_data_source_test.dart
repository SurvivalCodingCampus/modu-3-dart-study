import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:test/test.dart';


void main() {
  const todoId = 1;
  const todoTitle = 'delectus aut autem';
  const todoCompleted = false;

  group('TodoSingleDataSourceImpl - 과제 1', () {
    final dataSource = TodoSingleDataSourceImpl();

    test('getTodo() 는 Todo 객체로 반환 되었는지', () async {
      final todo = await dataSource.getTodo();
      print('Todo: ${todo?.toJson()}');
      expect(todo, isNotNull);
      expect(todo?.id, todoId);
      expect(todo?.title, todoTitle);
      expect(todo?.completed, todoCompleted);

    });
  });
}
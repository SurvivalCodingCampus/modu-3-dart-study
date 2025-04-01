import 'package:test/test.dart';

import '../../../assignments/2025_04_01/solution3/data_source/todo_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution3/mock/mock_todo_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution3/repository/todo_repository.dart';
import '../../../assignments/2025_04_01/solution3/repository/todo_repository_impl.dart';

void main() {
  group('Data Source', () {
    final todoDataSource = TodoDataSourceImpl();
    test('Data Source 제대로 잘 가져오는지 확인', () async {
      final result = await todoDataSource.getTodos();

      print(result);

      expect(result.length, 200);
    });
  });

  group('Repository', () {
    final TodoRepository todoRepository = TodoRepositoryImpl(
      TodoDataSourceImpl(),
    );
    test('TodoList', () async {
      final result = await todoRepository.getTodos();

      print(result);

      expect(result.length, 200);
    });

    test('Completed TodoList', () async {
      final result = await todoRepository.getCompletedTodos();

      print(result);

      expect(result.length, 90);
    });
  });

  group('Mock Data', () {
    final mockTodoDataSource = MockTodoDataSourceImpl();
    test('Mock length test', () async {
      final result = await mockTodoDataSource.getTodos();

      print(result);

      expect(result.length, 4);
    });
  });
}

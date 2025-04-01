import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-31/practice_0331_01.dart';

void main() {
  group('TodoData test', () {
    test('getTodo', () async {
      final dataSource = TodoDataSourceImpl(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/todo.json',
      );
      final todo = await dataSource.getTodo();
      expect(todo, isA<Todo>());
      expect(todo.userId, 1);
      expect(todo.id, 1);
      expect(todo.title, 'delectus aut autem');
      expect(todo.completed, false);
    });
    test('getTodos', () async {
      final dataSource2 = TodoDataSourceImpl(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/tododata_source.json',
      );
      final todo2 = await dataSource2.getTodos();
      expect(todo2, isA<List<Todo>>());
      expect(todo2.length, 200);
    });
  });
}

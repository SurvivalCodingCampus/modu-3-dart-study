
import 'package:modu_3_dart_study/2025-03-31/todo_project/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/todo_project/model/todo.dart';
import 'package:test/test.dart';

void main() async {

  group('[ Todo 클래스 ] - ', ()
  {
    test(' todo 데이터 로딩 및 확인', () async {
      final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/todo_project/';
      final TodoDataSourceImpl dataSource = TodoDataSourceImpl(filePath + 'todo.json');
      final Todo todo = await dataSource.getTodo();

      expect(todo.userId, 1);
      expect(todo.id, 1);
      expect(todo.title, 'delectus aut autem');
      expect(todo.completed, false);

    });
  });
}


























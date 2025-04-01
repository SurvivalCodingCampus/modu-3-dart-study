import 'package:modu_3_dart_study/2025-03-31/todos_project/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/todos_project/model/todo.dart';
import 'package:test/test.dart';

void main() async {


  group('[ Todo 클래스 ] - ', ()
  {
    test(' todo 데이터 로딩 및 확인', () async {
      final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/todos_project/';
      final TodoDataSourceImpl dataSource = TodoDataSourceImpl(filePath + 'todos.json');
      final List<Todo> todos = await dataSource.getTodos();

      expect(todos[0].userId, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'delectus aut autem');
      expect(todos[0].completed, false);

    });
  });
}

























import 'package:modu_3_dart_study/2025-04/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class MockTodoDataSource implements DataSource<Todo> {
  @override
  Future<List<Todo>> load({String? relativePath}) async {
    return [
      Todo(id: 1, title: 'title', completed: true, userId: 3),
      Todo(id: 2, title: 'title', completed: false, userId: 2),
    ];
  }
}

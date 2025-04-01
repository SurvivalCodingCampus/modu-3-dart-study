import '../../model/todo.dart';
import '../todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl(super.dataSource, super.entity);

  @override
  Future<List<Todo>> getItemsByCompleted(String fileName) async {
    return await query(fileName, (e) => e.completed == true);
  }
}

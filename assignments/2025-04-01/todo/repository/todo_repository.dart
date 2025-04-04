import '../../utils/json_repository.dart';
import '../data_source/todo_data_source.dart';
import '../model/todo.dart';

abstract class TodoRepository
    extends JsonRepository<Todo, int, TodoDataSource> {
  TodoRepository(super.dataSource, super.entity);

  Future<List<Todo>> getItemsByCompleted(String fileName);
}

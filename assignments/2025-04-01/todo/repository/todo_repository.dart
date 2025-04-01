import '../../utils/json_repository.dart';
import '../data_source/impl/todo_data_source_impl.dart';
import '../model/todo.dart';

abstract interface class TodoRepository
    extends JsonRepository<Todo, bool, TodoDataSourceImpl> {
  TodoRepository(super.dataSource, super.entity);

  Future<List<Todo>> getItemsByCompleted(String fileFame);
}

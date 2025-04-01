import '../../../utils/json_repository.dart';
import '../../data_source/impl/todo_data_source_impl.dart';
import '../../model/todo.dart';
import '../todo_repository.dart';

class TodoRepositoryImpl extends JsonRepository<Todo, bool, TodoDataSourceImpl>
    implements TodoRepository {
  TodoRepositoryImpl(super.dataSource, super.entity);

  @override
  Future<List<Todo>> getItemsByCompleted(String fileName) async {
    return await query(fileName, (e) => e.completed == true);
  }
}

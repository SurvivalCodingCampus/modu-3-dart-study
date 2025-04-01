import '../../../base/base_data_source_impl.dart';
import '../todo_data_source.dart';

class TodoDataSourceImpl extends BaseDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final path = 'assignments/structure/2025-04-01/todo/data/todo.json';
    final resp = await getList(path);
    return resp;
  }
}

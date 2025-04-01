import 'todo/data_source/todo_data_source_impl.dart';

void main() async {
  final todoDataList = await TodoDataSourceImpl().getTodos();

  print(todoDataList);
}

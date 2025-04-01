import 'todo/data_source/todo_data_source_impl.dart';

void main() async {
  final todoData = await TodoDataSourceImpl().getTodo();

  print(todoData);
}

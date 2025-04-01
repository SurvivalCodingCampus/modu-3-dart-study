import '../model/todos.dart';

abstract interface class TodosDataSource {
  Future<List<Todos>> getTodos();
}

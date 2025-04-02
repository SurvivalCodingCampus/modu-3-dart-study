abstract interface class TodoDataSource {
  Future<List<Map<String, dynamic>>> fetchTodos(String path);
}

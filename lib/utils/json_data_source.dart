abstract interface class JsonDataSource {
  Future<Map<String, dynamic>> getItem();

  Future<List<Map<String, dynamic>>> getItems();
}

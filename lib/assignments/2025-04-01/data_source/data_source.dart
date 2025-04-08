abstract interface class DataSource {
  Future<List<dynamic>> getList(String filePath);
}

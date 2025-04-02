abstract interface class BaseDataSource {
  Future<List<Map<String, dynamic>>> getList(String path);
}

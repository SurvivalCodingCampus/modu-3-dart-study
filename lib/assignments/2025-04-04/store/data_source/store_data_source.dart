abstract interface class StoreDataSource {
  Future<List<Map<String, dynamic>>> getStores();
}

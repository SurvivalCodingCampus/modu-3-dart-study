abstract interface class DataSource<T> {
  Future<List<T>> load({String relativePath});
}

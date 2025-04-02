abstract interface class Repository<T, KEY> {
  Future<List<T>> findAll();
  Future<T> findOne(KEY id);
}

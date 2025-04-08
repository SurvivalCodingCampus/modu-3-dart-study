abstract interface class Repository<T, ID, DTO> {
  Future<T?> findOne(ID id);
  Future<T?> findByFilter(bool Function(T predicate) predicate);
  Future<List<T>> findAll();
}

import '../model/store.dart';

typedef FindOneFilter = bool Function(Store predicate);

abstract interface class StoreRepository {
  Future<Store?> findOne(FindOneFilter predicate);
  Future<List<Store>> findAll();
}
